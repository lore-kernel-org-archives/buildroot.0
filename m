From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 23:00:31 +0100
Subject: [Buildroot] [PATCH v2] package/snappy: add dependency on
	host-pkgconf
In-Reply-To: <201412171225.59482.ste@junkomatic.net> (Steve James's message of
 "Wed, 17 Dec 2014 12:25:59 +0000")
References: <201412171225.59482.ste@junkomatic.net>
Message-ID: <87wq5ofwjk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve James <ste@junkomatic.net> writes:

 > Snappy doesn't configure without host pkg-config, causing this totally 
 > unhelpful diagnostic from autoconf:

 >   configure.ac:42: error: possibly undefined macro: AC_DEFINE
 >         If this token and others are legitimate, please use m4_pattern_allow.
 >         See the Autoconf documentation.
 >   configure.ac:44: error: possibly undefined macro: AC_MSG_FAILURE

 > So add host-pkgconf to the package's DEPENDENCIES list.

 > Signed-off-by: Steve James <ste@junkomatic.net>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - Reorganised this commit comment only; no change to the patch itself

Committed, thanks.

-- 
Bye, Peter Korsgaard
