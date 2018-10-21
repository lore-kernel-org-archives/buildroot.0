From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:27:20 +0200
Subject: [Buildroot] [PATCH 0/3] Misc gcc fixes/improvements
In-Reply-To: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
References: <20181021115415.21471-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181021162720.79db6923@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 13:54:12 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (3):
>   package/gcc: disable libcilkrts when there is no thread support
>   package/gcc: introduce BR2_GCC_SUPPORTS_LIBCILKRTS
>   package/gcc: remove BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE

Series applied. Thanks Romain for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
