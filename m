From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 11:51:56 +0100
Subject: [Buildroot] Setting up Perf for buildroot
In-Reply-To: <45ecb208-6863-4266-9091-ec981005978b@zimbra2.corp.accelance.fr>
References: <CAPDLWs_Y9e_ecsk=U-PteDfFA=B8t9krpc8CM5ZzAYJ2uwH-hQ@mail.gmail.com>
 <45ecb208-6863-4266-9091-ec981005978b@zimbra2.corp.accelance.fr>
Message-ID: <20121228115156.2f91b588@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

Please fix your e-mail client to wrap lines at a reasonable width.

On Fri, 28 Dec 2012 11:18:06 +0100 (CET), Jeremy Rosen wrote:

> my guess is that ideally the config entries should be in packages->debug tools, but the makefile should be integrated in the linux kernel makefile
> 
> I don't think it's possible with KConfig, though...
> 
> 
> maybe add a perf directory in the packages/ dir with only the Config.in and use the variables set by that Config.in within the kernel makefiles to build the tool

See:

Subject: Re: [Buildroot] [PATCH v3] usbip: new package
Date: Wed, 26 Dec 2012 18:32:20 +0100

where I did some suggestions on how to do this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
