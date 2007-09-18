From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Tue, 18 Sep 2007 15:52:12 +0530
Subject: [Buildroot] Busy box does not work with Buildroot toolchain for
	arm926ejs
Message-ID: <C03A3C267DDF184EA523BBAB577BF924F03F5E@blrexsr1.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kans,

No Sorry. No Changes Been trying all possible options but no go

Regards
Gururaja


-----Original Message-----
From: kannappan@tesbv.com [mailto:kannappan at tesbv.com] 
Sent: Monday, September 17, 2007 10:09 PM
To: Gururaja Hebbar K R
Subject: Busybox does not work with Buildroot toolchain for arm926ejs

Hi Hebbar,

did you find any solutions for this?  I am also facing the same problem.

-
Kans.
Hebbar wrote:
> 
> Hi All,
> 
>  Here is the issue. 
> 1. I have used busybox utilities built inside 
> buildroot/project_build_arm/uclibc-prj/root. I am using Linux kernel 
> version 2.6.20.6. when i boot, the busybox does not start and give any

> command prompt on serial console or tty0.
> 
> It gives the message like "Please press Enter to activate this
console".
> 
> 2. Also i have compilled the above Linux kernel with the same 
> buildroot toolchain for arm926ejs and it works fine.
> 
> 3. I tried using the same toolchain and compilled an externally 
> downloaded busybox and when used this, i get the same error.
> 
> 4. Also if i use Linux Kernel compilled with this Buildroot Toolchain 
> for arm926ejs and Busybox built with other vendor toolchain( from
> Codesourcery) it works fine. 
> 
> 5. Also i have Linux MTD Utilities that i have compilled using 
> Buildroot Toolchain & this works fine.
> 
> So i want to know what exactly is the issue with busybox thats been 
> built by this Buildroot toolchain.
> 
> Attahced is the Busybox config, uclibc config & my Buildroot config.
> 
> Waiting for an early reply/help to solve this issue.
> 
> Regards
> Guruaja
> busybox.config uclibc.config buildroot_snapshot.config
> 
Quoted from: 
http://www.nabble.com/Busybox-does-not-work-with-Buildroot-toolchain-for
-arm926ejs-tf4439704.html#a12667270
