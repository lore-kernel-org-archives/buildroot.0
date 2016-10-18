From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 11:46:15 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
 16.04
In-Reply-To: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20161018114615.4a6f95b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 23:53:02 +0200, Angelo Compagnucci wrote:

> +		sudo apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine

Why are you doing this step?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
