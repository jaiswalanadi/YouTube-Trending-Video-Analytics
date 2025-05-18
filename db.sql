import sqlite3

# Prepare SQLite in-memory database and insert cleaned DataFrame
conn = sqlite3.connect(":memory:")
df.to_sql("videos", conn, index=False, if_exists="replace")

# SQL query: Rank category_id by average views
query = """
SELECT category_id, 
       COUNT(*) AS video_count,
       ROUND(AVG(views), 2) AS avg_views,
       ROUND(AVG(likes), 2) AS avg_likes,
       ROUND(AVG(dislikes), 2) AS avg_dislikes
FROM videos
GROUP BY category_id
ORDER BY avg_views DESC
LIMIT 10;
"""

category_ranking = pd.read_sql_query(query, conn)
category_ranking



Result
   category_id  video_count   avg_views  avg_likes  avg_dislikes
0           20           66  4162462.21  101632.24       5176.00
1           30           16  3065001.25   41415.69       2136.38
2           10         3858  2631115.73   65922.38       3896.06
3            1         1658  2320355.55   41762.09       2602.58
4           17          731  1887755.35   45102.58       1800.79
5           15            3  1626581.00  120844.67       2162.67
6           24        16712   964599.75   23704.32       1641.27
7           26          845   872595.97    9336.34       1017.52
8           28          552   864331.55   38760.12       1655.08
9           23         3429   842132.42   50777.10       2034.56
