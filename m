From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Feb 2017 23:50:43 +0100
Subject: [Buildroot] [PATCH 1/1] support/misc/Vagrantfile: Enable website
In-Reply-To: <1486247634-5995-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1486247634-5995-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170204235043.2d80212c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Feb 2017 23:33:54 +0100, Angelo Compagnucci wrote:
> This patch enables buildroot website inside Vagrant
> and makes it accessible on localhost:8888 outside. It could be
> usefull for website development or simply navigating it
> without internet access.
> 
> * Removed apt-get update to speedup first boot
> * Moved archive download at first to accomodate Apache
> * Added Apache configuration via here document
> * Added 80 to 8888 port redirection
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Why would we want to include this in the Vagrantfile? The point of
the Vagrantfile is to create a system that is known to work to use
Buildroot, not something for the few people who happen to work on
Buildroot's web site. So I really don't see why would we add all this
complexity to the Vagrantfile.

Could you explain the rationale ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
