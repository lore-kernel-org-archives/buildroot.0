From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Mar 2019 20:25:30 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5base: build Qt 5.6 with
 LibreSSL if present.
In-Reply-To: <20190303055103.39033-1-jamesg@zaltys.org> (James Grant's message
 of "Sun, 3 Mar 2019 18:51:03 +1300")
References: <20190303055103.39033-1-jamesg@zaltys.org>
Message-ID: <87ef7migr9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Grant <jamesg@zaltys.org> writes:

 > LibreSSL build is successful with shared linkage, but not default dlopen().
 > Also adds patch for successful compilation by using -fpermissive.

 > Signed-off-by: James Grant <jamesg@zaltys.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
