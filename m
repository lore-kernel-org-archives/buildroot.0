From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 19 Sep 2011 14:27:08 +0200
Subject: [Buildroot] [git commit] support: move patch-kernel.sh and
 rename it
In-Reply-To: <20110917063643.361CC8D728@busybox.osuosl.org>
References: <20110917063643.361CC8D728@busybox.osuosl.org>
Message-ID: <4E77351C.6000302@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 9/17/2011 8:22 AM, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=59a326b934737483531c49c99acda7874c72e335
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> The name "patch-kernel.sh" is a bit stupid, since this script is used
> to patch everything in Buildroot, not only kernel trees.
By the way, what do you think about a old patch ([RFC PATCH 
v2]kernel-patch.sh: script changed to support archives in a proper way) 
I have sent since I had troubles to apply several patches (contained 
into a compressed archive) to the kernel because the order to apply 
patch was not correct.

Does BuildRoot offer another way to manage this case and I have missed it ?


> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
>
Regards

Ludovic
