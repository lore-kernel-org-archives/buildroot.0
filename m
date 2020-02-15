From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:02:19 +0100
Subject: [Buildroot] [PATCH] package/postgresql: security bump to
 version 12.2
In-Reply-To: <20200214083910.26327-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Feb 2020 09:39:10 +0100")
References: <20200214083910.26327-1-peter@korsgaard.com>
Message-ID: <87mu9kjepw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-1720: ALTER ... DEPENDS ON EXTENSION is missing authorization checks
 >   https://www.postgresql.org/about/news/2011/

 > Update the license hash for a change in copyright years:
 > -Portions Copyright (c) 1996-2019, PostgreSQL Global Development Group
 > +Portions Copyright (c) 1996-2020, PostgreSQL Global Development Group

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
