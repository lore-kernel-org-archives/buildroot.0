From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 May 2017 17:53:24 +0200
Subject: [Buildroot] ~/buildroot/packages
In-Reply-To: <CACo+m-trSpHVnX6ccbqQM+1x1FSfBWSj39C8Nk2+961VCT3hLQ@mail.gmail.com>
References: <CACo+m-trSpHVnX6ccbqQM+1x1FSfBWSj39C8Nk2+961VCT3hLQ@mail.gmail.com>
Message-ID: <20170518175324.19b2a7e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 17:08:42 +0200, moi moi wrote:

> Is it normal behaviour of buildroot to populate the packages folder with
> 40+MBs of various .mk and .in files? Does buildroot copy packages from the
> host system? I have run menuconfig once but have not buildt a system with
> make. There are even folder for opencv and fetchmail there (which are
> present on my host system).

It seems like you really misunderstood what Buildroot's purpose is.
Those .mk and .in files describe how to build a large number of
software components to create an embedded Linux system.

Therefore, if you enable Busybox in your Buildroot configuration,
Buildroot will know how to download, build and install Busybox thanks
to the information available in package/busybox/.

The list of packages supported by Buildroot has *nothing* to do with
what is installed on your host system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
