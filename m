From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 18:08:54 +0100
Subject: [Buildroot] ARM cores
In-Reply-To: <4D3DA411.8080906@free.fr>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk> <20110124165711.381989cf@surf>
	<4D3DA411.8080906@free.fr>
Message-ID: <20110124180854.5ee86742@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Jan 2011 17:08:49 +0100
Eric BENARD <ebenard@free.fr> wrote:

> NEON (and VFP) is a feature of cortex A8 :
> http://www.arm.com/products/processors/cortex-a/cortex-a8.php
> 
> It's optional on A5 & A9 but not on A8.

Yes, sorry. I've given the example of Marvell Dove and Nvidia Tegra 2,
which presumably are Cortex-A9. But it doesn't change my initial
comment: if the user says "I'm using Cortex A9", it's not enough to
decide whether you can use NEON or not.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
