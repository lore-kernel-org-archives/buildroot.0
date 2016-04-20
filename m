From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2016 11:25:20 -0300
Subject: [Buildroot] [PATCH 1/1] Raspberry PI 3 kernel,
 firmware and dtb update
In-Reply-To: <87wpnsdaf2.fsf@dell.be.48ers.dk>
References: <1459421492-18815-1-git-send-email-ubaldo@eja.it>
 <87a8kpe39z.fsf@dell.be.48ers.dk> <20160419213321.GG3505@free.fr>
 <87wpnsdaf2.fsf@dell.be.48ers.dk>
Message-ID: <57179150.9050209@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/16 04:08, Peter Korsgaard wrote:

> Yeah. I don't know about the rpi foundation, but there seems to be quite
> some aarch64 activity around it in mainline U-Boot/Linux.
>
> With the recent vc4 work it might make sense to add rpi defconfigs using
> mainline as well?

I have a WIP rpi2 open defconfig, however the kernel part eludes me a 
bit, plain vanilla doesn't seem ready for vc4 right away and i'm 
probably missing some patches/pull to complete enable it (symptom: oops).
I can share in private if anybody is interested in picking up/trying to fix.
Regards.
