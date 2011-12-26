From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 26 Dec 2011 17:50:18 +0200
Subject: [Buildroot] Buildroot 2011.11 on x86_64 - neither udev nor mdev
 loads needed modules at startup
In-Reply-To: <4EF89684.8070401@gmail.com>
References: <4EF879B6.8080902@gmail.com> <4EF89684.8070401@gmail.com>
Message-ID: <CALR4fELfX4RSJyN-V+NB5sOQAQQhbrvrGqM4SU3fs-tnAyg90A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While not a solution...

On Mon, Dec 26, 2011 at 5:45 PM, Wojciech Zabolotny <wzab01@gmail.com>wrote:

>
> Anyway the reason why the modules are not loaded automatically is still
> unclear :-(.


When I started using buildroot for my devices, I found the same problem.
However, since this is a dedicated device, the amount of hardware that can
be plugged in is rather small... so I "modprobed" the needed modules (2-3)
and continued.

How are modules loaded enerally, the kernel requests them from a user space
utility?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111226/4d512e37/attachment.html>
