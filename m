From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 08:48:41 +0100
Subject: [Buildroot] [PATCH] Buildroot uClibc-0.9.29 patches not present
	in	uClibc-0.9.30
In-Reply-To: <495801C7.7090807@gmail.com> (Omar BELKHODJA's message of "Sun\,
	28 Dec 2008 23\:46\:31 +0100")
References: <1229806548.30378.10.camel@linux-yrgm.site>
	<495801C7.7090807@gmail.com>
Message-ID: <87vdt34e1y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Omar" == Omar BELKHODJA <omar.belkhodja@gmail.com> writes:

 Omar> I'm trying also to build for an arm target, and the build is failing for the
 Omar> same reason. After doing make, it is trying to download the file

 Omar> http://www.uclibc.org/downloads/uClibc-locale-20081111-32-eb.tgz

 Omar> Is there any trick to build again the locale file ?

Yes, don't use the pregenerated locales (disable
BR2_ENABLE_LOCALE_PREGENERATED) - See r24516.

-- 
Bye, Peter Korsgaard
