From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 23:58:03 +0100
Subject: [Buildroot] [PATCH 09/10] package/mpv: make it a waf-package
In-Reply-To: <5405b08670b69296777ecefbd8c616a9053686a7.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <5405b08670b69296777ecefbd8c616a9053686a7.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <20161202235803.233e8440@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:02:20 +0100, Yann E. MORIN wrote:

> +MPV_BUNDLED_WAF = NO

Applied with this line changed to MPV_NEEDS_EXTERNAL_WAF = YES.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
