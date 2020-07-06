From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jul 2020 09:32:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-greenlet: add x86_64 as
 supported arch
In-Reply-To: <20200705215435.148058-1-james.hilliard1@gmail.com>
References: <20200705215435.148058-1-james.hilliard1@gmail.com>
Message-ID: <20200706093221.33e16540@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Jul 2020 15:54:34 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> -	default y if BR2_x86
> +	default y if BR2_x86 || BR2_x86_64

In fact BR2_x86 doesn't even exist in Buildroot, it's BR2_i386 for the
x86 32 bit architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
