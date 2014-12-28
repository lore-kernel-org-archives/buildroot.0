From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 13:58:10 +0100
Subject: [Buildroot] [PATCH 3/3 v2] toolchain: add hashes for all
 remaining external toolchains
In-Reply-To: <f924e745902fb357ec83221b28fb8a0f9a38a311.1419768498.git.yann.morin.1998@free.fr>
References: <cover.1419768498.git.yann.morin.1998@free.fr>
 <f924e745902fb357ec83221b28fb8a0f9a38a311.1419768498.git.yann.morin.1998@free.fr>
Message-ID: <20141228135810.763ae357@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Dec 2014 13:19:31 +0100, Yann E. MORIN wrote:

> +# Buildroot (?)
> +sha256 3e1c7c53fadfd3346ab60386c573f07f0617ab119546ec8cb93bc20c23cff2b3  lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
> +sha256 b72f7be654a75bb643372f3909de7b8739f0f56bdf8bea98fea41dcecefe6b6b  microblazeel-unknown-linux-gnu.tgz
> +sha256 ed2fea022f2def257ca6db09911b73c7102aaa1792d2da2d81371a763e5c2eff  lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
> +sha256 53ee0b1ad50e651eb14d0b53044b90e7bf7e3cb341ee57fe575bc4c4e142ea37  microblaze-unknown-linux-gnu.tgz

These are not Buildroot toolchains. They are provided by Xilinx, but
hosted on sources.buildroot.net since the official site was not working
anymore, or something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
