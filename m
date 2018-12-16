From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 11:59:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/meson: fix cpu_family format
In-Reply-To: <1544944395-2049-1-git-send-email-james.hilliard1@gmail.com>
References: <1544944395-2049-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181216115922.263866e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Dec 2018 15:13:15 +0800, james.hilliard1 at gmail.com wrote:

> Meson expects the cpu_family to be in a specific format for
> cross compilation, otherwise packages that use cpu_family
> detection may fail to build.

Could you be more specific than "may fail to build" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
