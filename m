From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 09:35:42 +0200
Subject: [Buildroot] [PATCH] package/gnupg2: security bump to version
 2.2.23
In-Reply-To: <20200904102415.31489-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 4 Sep 2020 12:24:15 +0200")
References: <20200904102415.31489-1-peter@korsgaard.com>
Message-ID: <87363wn0a9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-25125: Importing an OpenPGP key having a preference list for AEAD
 > algorithms will lead to an array overflow and thus often to a crash or other
 > undefined behaviour (affected: 2.2.21 / 2.2.22)

 > For more details, see the announcement:
 > https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000448.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
