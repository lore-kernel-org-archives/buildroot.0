From: Eric BENARD <ebenard@free.fr>
Date: Mon, 24 Jan 2011 17:08:49 +0100
Subject: [Buildroot] ARM cores
In-Reply-To: <20110124165711.381989cf@surf>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>	<87lj2ahe4y.fsf@macbook.be.48ers.dk>
	<20110124165711.381989cf@surf>
Message-ID: <4D3DA411.8080906@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 24/01/2011 16:57, Thomas Petazzoni wrote:
> For example, some video decoders have specific code to use NEON
> instructions, but those instructions are not available on Cortex-A8
> cores for example.
>
NEON (and VFP) is a feature of cortex A8 :
http://www.arm.com/products/processors/cortex-a/cortex-a8.php

It's optional on A5 & A9 but not on A8.

Eric
