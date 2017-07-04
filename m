From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 23:49:34 +0200
Subject: [Buildroot] [PATCH 0/3 v3] skeleton: move ifupdown script to
 their own package
In-Reply-To: <cover.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <20170704234934.458e6239@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Jul 2017 16:35:16 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (3):
>       package/ifupdown-scripts: new package
>       package/ifupdown-scripts: not needed for systemd-networkd
>       package/ifupdown-scripts: allow use with a custom skeleton

I've applied those patches. As discussed with Arnout and you, I've
squashed PATCH 1 and PATCH 2. And in PATCH 1, I've removed the empty
IFUPDOWN_SCRIPTS_SOURCE variable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
