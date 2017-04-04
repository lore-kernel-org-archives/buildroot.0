From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 22:02:58 +0200
Subject: [Buildroot] [PATCH v2 2/2] Revert "odroid-mali: mark package as
 BROKEN"
In-Reply-To: <20170325123918.19055-2-daggs@gmx.com>
References: <20170325123918.19055-1-daggs@gmx.com>
 <20170325123918.19055-2-daggs@gmx.com>
Message-ID: <20170404220258.4cb25467@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 15:39:18 +0300, Dagg Stompler wrote:
> This reverts commit e2ac546c1951ba8a3e88965d3023eb38a9493f28.
> ---
>  package/odroid-mali/Config.in | 10 ----------
>  1 file changed, 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
