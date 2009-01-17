From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Sun, 18 Jan 2009 08:07:10 +0900
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <87fxjh3nhq.fsf@macbook.be.48ers.dk>
References: <20090116141347.DD52277567@busybox.osuosl.org>	<4971FB3A.4050904@ruby.dti.ne.jp>
	<87fxjh3nhq.fsf@macbook.be.48ers.dk>
Message-ID: <4972649E.2010609@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Shinya" == Shinya Kuribayashi <skuribay@ruby.dti.ne.jp> writes:
> 
>  >> -	default BR2_GCC_VERSION_4_2_4 if !BR2_avr32
>  >> +	default BR2_GCC_VERSION_4_3_2 if !BR2_avr32
>  >> default BR2_GCC_VERSION_4_2_3 if BR2_avr32
>  >> help
>  >> Select the version of gcc you wish to use.
> 
>  Shinya> GCC 4.3.2 bootstrap failed;  mips, mips4 and o32 on Ubuntu 8.04.01.
> 
> Strange, mips worked here (Debian)
> 
> uclibc.org/~jacmet/br/mips.log

Thanks for your confirmation.

> And 4.2.4 works for you?

Yes (forgot to mention, sorry).

As Frank pointed out, this problem seems to be related to the host gcc
version.  I'll check the config.log and let you know what internally
happens.

  Shinya
