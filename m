From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:35:22 +0100
Subject: [Buildroot] [PATCH 3/4] package/pseudo: add a legacy symlink to
 emulate fakeroot
In-Reply-To: <52f872897022915168b1df835622d5fba57e1780.1478211656.git.yann.morin.1998@free.fr>
References: <cover.1478211656.git.yann.morin.1998@free.fr>
 <52f872897022915168b1df835622d5fba57e1780.1478211656.git.yann.morin.1998@free.fr>
Message-ID: <20161103233522.4fa49246@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 23:21:07 +0100, Yann E. MORIN wrote:
> In cae some post-image script want to call fakeroot, add a symlink to

cae -> case

> use pseudo instead.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied with the minor typo fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
