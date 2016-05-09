From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:53:46 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi3: fix serial console (load
 pi3-miniuart-bt overlay)
In-Reply-To: <20160509225150.7f4f40e7@gmx.net>
References: <1462220744-6368-1-git-send-email-ps.report@gmx.net>
 <CALtfCQZowiGZUJ0HV4oTyRMfMY02TherviK_ZE6D4wgfUcQ3gg@mail.gmail.com>
 <871t5jr7e6.fsf@dell.be.48ers.dk>
 <CAFGQKxeRKWNCOH2YV0FYA17tdfyeemv3Xau2Bkrzmrxh5Rm-4g@mail.gmail.com>
 <20160503210200.12d685a7@gmx.net>
 <CAFGQKxc63EUZX8RNL_NE=VWnsVf_CoyK5b9K_SWyk2rgc4CutA@mail.gmail.com>
 <20160509225150.7f4f40e7@gmx.net>
Message-ID: <20160509225346.5001edf7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 May 2016 22:51:50 +0200, Peter Seiderer wrote:

> > I wonder if the solution is to just document the situation in
> > board/raspberrypi/readme.txt.  The documentation could just detail the
> > available choices for Bluetooth and serial console on the rpi3 and how
> > to configure each manually.  A summary of the available choices is:
> > 
> > 1) Default setup - Serial console does not work, Bluetooth works
> > 2) Add enable-uart=1 - Serial console works but the core frequency is
> > fixed.  Serial console max baud rate is less than the rpi2. Bluetooth
> > works.
> > 3) Use pi3-miniuart-bt - Serial console works the same as the rpi2 but
> > Bluetooth runs slow.
> > 4) Use pi3-disable-bt - Serial console works the same as the rpi2 but
> > Bluetooth is disabled.
> > 
> > What do you think?  
> 
> Agreed, with bias to 3) as the default (or one of the other solutions with
> serial console enabled)...

Yes, sounds like a good idea.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
