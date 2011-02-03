From: Davis Mcpherson <davis.mcpherson@gmail.com>
Date: Thu, 3 Feb 2011 07:38:58 -0500
Subject: [Buildroot] Buildroot compatiable with Linux kernel 2.6.14
Message-ID: <C00253FF-C6FC-425D-B030-FE312668B071@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working on a project that currently requires me to use Linux kernel version 2.6.14 for the embedded target I'm building for, 

 Should I use a specfic version of Buildroot to ensure compatibility with with this kernel or should the latest stable version work? 


 Do I need to set any Buildroot configuration options to reference the kernel source tree I'm using?  I see a config option under Toolchain to specify the kernel version for 'Kernel Headers' but i'm not sure what this affects?  Is it just the toolchain tools and should thus match the kernel on the build machine or should this be set to the version of the kernel running on the target?

thanks for your time and suggestions

-davis mcpherson
