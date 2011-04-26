From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 15:02:39 +0200
Subject: [Buildroot] [PATCH 8/9] libraw : new package
In-Reply-To: <1299831215-26466-8-git-send-email-cmchao@gmail.com> (Chih-Min
	Chao's message of "Fri, 11 Mar 2011 16:13:34 +0800")
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
	<1299831215-26466-8-git-send-email-cmchao@gmail.com>
Message-ID: <87ei4p5fo0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chih-Min" == Chih-Min Chao <cmchao@gmail.com> writes:

 Chih-Min> Signed-off-by: Chih-Min Chao <cmchao@gmail.com>

Sorry for slow response - Committed with minor tweaks, thanks!

 Chih-Min> +++ b/package/libraw/libraw.mk
 Chih-Min> @@ -0,0 +1,15 @@
 Chih-Min> +#############################################################
 Chih-Min> +#
 Chih-Min> +# libraw
 Chih-Min> +#
 Chih-Min> +#############################################################
 Chih-Min> +LIBRAW_VERSION:=0.13.1
 Chih-Min> +LIBRAW_SOURCE:=LibRaw-$(LIBRAW_VERSION).tar.gz
 Chih-Min> +LIBRAW_SITE:=http://www.libraw.org/data/

We normally use ' = ' here rather than ':='

-- 
Bye, Peter Korsgaard
