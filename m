From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Oct 2015 14:53:29 +0100
Subject: [Buildroot] [PATCH v2] olimex_a20_olinuxino_lime2: new board
In-Reply-To: <1439827305-26741-1-git-send-email-viktorin@rehivetech.com>
References: <1439477297-23492-1-git-send-email-viktorin@rehivetech.com>
 <1439827305-26741-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <20151003145329.7edd38a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan,

On Mon, 17 Aug 2015 18:01:45 +0200, Jan Viktorin wrote:

> +BR2_CCACHE=y
> +BR2_OPTIMIZE_2=y

These two options should not be part of a defconfig, so I got rid of
them, and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
