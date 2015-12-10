From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Thu, 10 Dec 2015 19:21:42 +0530
Subject: [Buildroot] buildroot config file not saving -- to particular
	location
In-Reply-To: <CAKpDV8u_w7sCDth528JXyc94312BFnJWrC34Gdk1_M3Bkt+7Dg@mail.gmail.com>
References: <CAKpDV8u_w7sCDth528JXyc94312BFnJWrC34Gdk1_M3Bkt+7Dg@mail.gmail.com>
Message-ID: <CAKpDV8tLLdsGa+0uE0-pyCddK66GBz9msFO6sDeGCAubXSG8mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am following steps 4 & 5 in this link :--
https://buildroot.org/downloads/manual/manual.html#_quick_guide_to_storing_your_project_specific_customizations

But busybox .config file doesn't go to right path set.

Regards,
Dinesh
On Dec 10, 2015 11:32 AM, "Dinesh Guleria" <din.gulu.er@gmail.com> wrote:

> Hello Everyone,
>
> I am trying to copy buildroot configuation file to /home/dinesh/busybox
> location.
> But file is not saving at right location.
>
> I am running following command :---
> make busybox-update-config
> BR2_PACKAGE_BUSYBOX_CONFIG=/home/dinesh/busybox/busybox.config
>
> Please see the attached image, what output i am getting.
>
> How to resolve this.
>
> Regards,
> Dinesh
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151210/46bf4620/attachment.html>
