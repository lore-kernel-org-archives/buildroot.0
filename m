From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 10:34:31 +0200
Subject: [Buildroot] [PATCH v5] syslinux: build with the target toolchain
In-Reply-To: <20170411094551.404b3adb@armant.office.greenbone.net>
References: <1491473086-16647-1-git-send-email-benoit.allard@greenbone.net>
 <1491555913-7951-1-git-send-email-benoit.allard@greenbone.net>
 <20170408160825.1891b903@free-electrons.com>
 <20170411094551.404b3adb@armant.office.greenbone.net>
Message-ID: <20170412103431.33f1d053@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 09:45:51 +0200, Beno?t Allard wrote:

> > Applied to master, thanks. Now, could you try to submit those patches
> > to the upstream project?  
> 
> I'm on it, unfortunately, the traction is not very high. I feel like I
> opened one of those can of worms that have been tackled over and over
> again without reaching a satisfactory solution (autoconf ?!). The first
> answer I got was 'stop assuming everyone has needs similars to yours',
> I'm now waiting on further one.
> 
> You can follow the show over there:
> http://www.syslinux.org/archives/2017-April/

Thanks for doing this work. I think your reply is good, and hopefully
will make the syslinux developers change a bit their mind. If not, then
fine, we can keep the patches in Buildroot. I at least would like
people to try upstreaming the patches, and make reasonable efforts,
which you did.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
