From: Christian Stewart <christian@paral.in>
Date: Fri, 3 May 2019 16:36:42 -0700
Subject: [Buildroot] Buildroot multi-arch build
In-Reply-To: <BL0PR0102MB341237052A8B224C63E58B9FF3350@BL0PR0102MB3412.prod.exchangelabs.com>
References: <BL0PR0102MB341237052A8B224C63E58B9FF3350@BL0PR0102MB3412.prod.exchangelabs.com>
Message-ID: <CA+h8R2r8YCOuvkYXLzy7dp6FxNWkznCxWZicmpsCMzAabtqR7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,


On Fri, May 3, 2019, 1:49 PM Gervais, Francois <
FGervais@distech-controls.com> wrote:

> We use the same buildroot environment for x86_64, armhf and arm64.
>
> For each architecture, everything is the same except for the architecture
> definition.
>
> Is there a way to achieve this without maintaining 3 config files?
>

I'm not aware of a buildroot-only way to do this, but FWIW, my project
SkiffOS is specifically designed to do this (layering packages of
configuration fragments on top of each other).

https://github.com/paralin/SkiffOS

Maybe it will be of some use to you?

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190503/496165f2/attachment.html>
