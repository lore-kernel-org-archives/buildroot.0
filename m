From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 10:54:21 +0100
Subject: [Buildroot] =?utf-8?b?4oCYX19jdHlwZV90b3VwbG93X3TigJkgYW5kIA==?=
 =?utf-8?b?4oCYX19jdHlwZV9tYXNrX3TigJkgZG9lcyBub3QgbmFtZSBhIHR5cGU=?=
In-Reply-To: <CAJEG_NdqCrS=ny=BMgF4n8ui5kavmOxtWyzMvxe-_97e=wRPTg@mail.gmail.com>
References: <CAJEG_NdqCrS=ny=BMgF4n8ui5kavmOxtWyzMvxe-_97e=wRPTg@mail.gmail.com>
Message-ID: <20130315105421.675ecf61@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jorge Ventura,

On Thu, 14 Mar 2013 14:07:48 -0500, Jorge Ventura wrote:

> It seems that something is missing in my uClibc configuration that cause
> the two types be undefined or another include is missing in the code that I
> am trying to compile.
> 
> Someone has any clue about this problem?

Is this happening after a complete "make clean all" cycle? If so, could
you post your Buildroot .config? Did you modify the uClibc
configuration with "make uclibc-menuconfig" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
