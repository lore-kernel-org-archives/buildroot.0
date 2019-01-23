From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 15:31:09 +0100
Subject: [Buildroot] [PATCH] package/sqlite: security bump to version
 3.25.3
In-Reply-To: <20181222074448.24100-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 22 Dec 2018 08:44:47 +0100")
References: <20181222074448.24100-1-peter@korsgaard.com>
Message-ID: <87munrla36.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-20346: SQLite before 3.25.3, when the FTS3 extension is
 > enabled, encounters an integer overflow (and resultant buffer overflow) for
 > FTS3 queries that occur after crafted changes to FTS3 shadow tables,
 > allowing remote attackers to execute arbitrary code by leveraging the
 > ability to run arbitrary SQL statements (such as in certain WebSQL use
 > cases), aka Magellan.

 > For more details, see:
 > https://blade.tencent.com/magellan/index_en.html
 > https://www.sqlite.org/releaselog/3_25_3.html
 > https://www.mail-archive.com/sqlite-users at mailinglists.sqlite.org/msg113218.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
