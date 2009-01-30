From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 30 Jan 2009 11:14:35 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <1233309685.6293.17.camel@sven>
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk>  <1233309685.6293.17.camel@sven>
Message-ID: <1233310475.6293.20.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-01-30 at 11:01 +0100, Sven Neumann wrote:

> Does not work for my configuration. The error when compiling gcc is:
> 
>   Unknown ABI used in --with-abi=aapcs-linux

Might be related to
http://gcc.gnu.org/ml/gcc-patches/2008-09/msg01500.html

BR2_GCC_TARGET_ABI="aapcs" seems to be accepted. I will try to compile
my tree with this option now and also check if I can build a recent
kernel using the compiler that results from this build...


Sven
