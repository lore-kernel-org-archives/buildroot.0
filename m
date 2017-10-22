From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:50:59 +0200
Subject: [Buildroot] [PATCH] sqlite: add security patches
In-Reply-To: <612f27420cbbca777de7bfcf3747769cebe1727b.1508680808.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 22 Oct 2017 16:00:08 +0200")
References: <612f27420cbbca777de7bfcf3747769cebe1727b.1508680808.git.baruch@tkos.co.il>
Message-ID: <87vaj67q5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2017-13685: The dump_callback function in SQLite 3.20.0 allows
 > remote attackers to cause a denial of service (EXC_BAD_ACCESS and
 > application crash) via a crafted file.

 > CVE-2017-15286: SQLite 3.20.1 has a NULL pointer dereference in
 > tableColumnList in shell.c
 > because it fails to consider certain cases where
 > `sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure is never
 > initialized.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
