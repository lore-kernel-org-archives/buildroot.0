From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 10:08:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.0.beta5
In-Reply-To: <20190720093103.29357-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 20 Jul 2019 11:31:03 +0200")
References: <20190720093103.29357-1-bernd.kuhls@t-online.de>
Message-ID: <87imrh48aq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This bump brings buildroot in-line with Debian stable which also
 > provides this version after version 6.3 was removed from testing
 > in 2017: https://tracker.debian.org/pkg/fetchmail

 > Removed patches applied upstream:
 > https://gitlab.com/fetchmail/fetchmail/commit/bcab21a977732e2fe24f37cb394f913af0d8b166
 > https://gitlab.com/fetchmail/fetchmail/commit/a2ae6f8d15d7caf815d7bdd13df833fd1b2af5cc

 > fetchmailconf.py received various python3-related patches:
 > https://gitlab.com/fetchmail/fetchmail/commits/legacy_64/fetchmailconf.py

 > Therefore FETCHMAIL_REMOVE_FETCHMAILCONF_PY is not needed anymore.

 > Added license hash.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
