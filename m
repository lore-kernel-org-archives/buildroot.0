From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Oct 2016 19:49:00 +0200
Subject: [Buildroot] [PATCH 1/7] libglib2: bump to version 2.50.0
In-Reply-To: <7dc3ea74-e874-4b9b-b6e3-2789bf126616@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
 <20160921141148.3aedf147@free-electrons.com>
 <20161009220744.3f41b8f2@free-electrons.com>
 <7dc3ea74-e874-4b9b-b6e3-2789bf126616@zacarias.com.ar>
Message-ID: <20161010194900.069c347b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Oct 2016 10:04:59 -0300, Gustavo Zacarias wrote:

> Hi.
> Hmmm ok... this causes more problems than it solves IMO.
> So now what, revert gvfs, glibmm, gtk, gtkmm, wayland, weston, legacy ?

Hm, sadly, it causes some other problems. And indeed, if nobody takes
care of the crc32 issue, the only option will be to revert all those
packages. I can't take care of fixing all autobuilder issues myself.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
