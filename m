From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 23:23:07 +1300
Subject: [Buildroot] [PATCH 1/1] package/cbootimage: enable target
 variant
In-Reply-To: <1482181701-2671-1-git-send-email-zombah@gmail.com>
References: <1482181701-2671-1-git-send-email-zombah@gmail.com>
Message-ID: <20170128232307.2c126d13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 00:08:21 +0300, Misha Komarovskiy wrote:
> This allow bootloader modification online on Tegra-targets
> 
> Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
> ---
>  package/Config.in                | 1 +
>  package/cbootimage/Config.in     | 9 +++++++++
>  package/cbootimage/cbootimage.mk | 1 +
>  3 files changed, 11 insertions(+)
>  create mode 100644 package/cbootimage/Config.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
