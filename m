From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:36:12 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/softether: New package
In-Reply-To: <20150308160250.52738a0d@free-electrons.com>
References: <1412459098-13939-1-git-send-email-bernd.kuhls@t-online.de>
 <20150308160250.52738a0d@free-electrons.com>
Message-ID: <20150308183612.69815aee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 8 Mar 2015 16:02:50 +0100, Thomas Petazzoni wrote:

> Applied, thanks. I've done some changes, the main one being that I'm
> pulling two patches from Github, which reduces the size of the patches
> to carry in package/softether.

There's one autobuilder failure on host-softether, see
http://autobuild.buildroot.org/results/1ea/1ea2635936c046729a70d7779eeb74490b4d0084/build-end.log.
Apparently, it forgets to pass -lrt, even though it's using
clock_gettime().

Can you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
