From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 15:51:38 +0200
Subject: [Buildroot] [PATCH v2] python-crossbar: bump to version 0.14.0
In-Reply-To: <1466062517-15428-1-git-send-email-yegorslists@googlemail.com>
References: <1466062517-15428-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160616155138.31cdc7b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 09:35:17 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> As python-msgpack dependency was replaced with python-u-msgpack,
> that is a pure Python implementation, BR2_TOOLCHAIN_HAS_SYNC_4
> was removed. BR2_INSTALL_LIBSTDCPP remains because of python-pyasn.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
> 	v2: remove BR2_TOOLCHAIN_HAS_SYNC_4 dependency (Thomas Petazzoni)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
