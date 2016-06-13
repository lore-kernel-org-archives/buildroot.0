From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 21:36:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: Fix build with
	c99 compilers
In-Reply-To: <1465843047-30583-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 13 Jun 2016 20:37:27 +0200")
References: <1465843047-30583-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87oa74yj84.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/734/734652bbdd7b6b18a8d67a30fe03bed62cd644e7/
 > http://autobuild.buildroot.net/results/d03/d03d36bfd4a97ff8091a815a45b4670bff992233/

You mean NOT c99 compilers. Committed with the commit message fixed /
extended, thanks.

-- 
Bye, Peter Korsgaard
