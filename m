From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 14:33:07 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <1515357573-10780-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1515357573-10780-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20180118143307.61b70db8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kurt,

On Sun,  7 Jan 2018 21:39:33 +0100, Kurt Van Dijck wrote:
> This commit adds a patch to respect the dependency libmount->libblkid->libuuid
> properly in autoconf. This becomes necessary for static builds.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

This problem is still occurring in the autobuilders. Could you send a
new version of this patch? The issues to be fixed were really minor.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
