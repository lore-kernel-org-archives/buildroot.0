From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:19:24 +0100
Subject: [Buildroot] [PATCH] support/misc/Vagrantfile: reorgainzing
 provisioining
In-Reply-To: <1488121729-29214-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1488121729-29214-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170226211924.76e09088@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 16:08:49 +0100, Angelo Compagnucci wrote:
> * Removed distribution upgrade cause it slows down the first boot
>   and presents a bug when executeted non interactively.
> * Reorganized provsion scripts to be in privileged and
>   non privileged sections
> * Added ubuntu mirror automatic hadling for apt packages
>   sources
> 
> Fixes: http://bugs.busybox.net/show_bug.cgi?id=9581
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks, I've applied to master.

However, as usual, your commit should have been split. It should be
clear from your commit log: you list three points that are completely
independent from each other. Hence, they should have been in three
separate commits.

Could you try to split your contributions more carefully in the future?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
