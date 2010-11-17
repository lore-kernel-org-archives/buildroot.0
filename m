From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Nov 2010 17:16:43 +0100
Subject: [Buildroot] arm-linux-ld: BFD 2.16.1 assertion fail
In-Reply-To: <35233.58461.qm@web114620.mail.gq1.yahoo.com>
References: <35233.58461.qm@web114620.mail.gq1.yahoo.com>
Message-ID: <20101117171643.3f701458@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Nov 2010 03:10:23 -0800 (PST)
Tamamontu M <tamamontu@yahoo.com.au> wrote:

> This is my post to this mailing list. Let me introduce myself, i have
> a cirrus logic EP9307 based board, with arm-linux-gcc 3.4 compiler. I
> am new to linux arm environment.  
> 
> I am trying to compile fat16 file system (originally based on lpc2148
> arm-elf-gcc). After porting it to EP9307, this source code uses std
> libraries, hence in order to use std libraries I added
> -L/usr/local/arm/3.4/lib -lc  to LDFLAGS in make file.

How is this related to Buildroot ?

You should also probably upgrade your toolchain, gcc 3.4 is now very
old.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
