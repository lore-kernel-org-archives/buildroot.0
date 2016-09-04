From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Sep 2016 15:20:39 +0200
Subject: [Buildroot] [PATCH 4/4 v2] manual: get rid of the lists of
 packages
In-Reply-To: <206a0e9bf7a1e99fa176fe1345d245881f14b858.1472943074.git.yann.morin.1998@free.fr>
References: <cover.1472943074.git.yann.morin.1998@free.fr>
 <206a0e9bf7a1e99fa176fe1345d245881f14b858.1472943074.git.yann.morin.1998@free.fr>
Message-ID: <20160904152039.1c00e023@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Sep 2016 00:58:43 +0200, Yann E. MORIN wrote:

> Those list take more than half of the manual. They do not serve much
> purpose except to show off. The only one that is interesting is the list
> of virtual packages, the associated symbols and their providers.

I would like to challenge the fact that the list of virtual packages is
more useful than the rest of the list.

virtual packages are purely internal things, you only need to know
about virtual packages when you're adding new packages in Buildroot.
And when you're adding new packages in Buildroot, you have far enough
experience to do a "git grep virtual-package" and find which ones are
available.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
