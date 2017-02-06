From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 21:34:14 +0100
Subject: [Buildroot] [PATCH 00/44] Linux-firmware: mass addition of
 missing firmware blobs
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206213414.2fc11b1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 15:24:13 -0500, Adam Duskett wrote:

> This rather large series of patches is here to add a bunch of missing firmware
> blob options to the menuconfig.  I didn't go as far as to add crazy things
> such as scsi controllers, and there are still several things missing, but I
> feel like this is a good start!

Do you need all of those firmware?

If not, then I believe it's better to just add them on demand, when
they are actually used/tested.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
