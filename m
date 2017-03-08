From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Mar 2017 09:40:19 -0300
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
 <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
Message-ID: <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Mar 8, 2017 at 7:06 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Before sending a patch I'd like to understand why the error only shows
> up in my case and not yours. I also trust that Rob built his atomic
> addition before pushing it.
>
> Can you send me the output of 'make kmscube-rebuild V=1' in your environment?

Sure, here is the log:
http://pastebin.com/QBDVLFDq

I just used the default toolchain from Buildroot.

There is a warning in the log and I have sent a patch to fix it upstream:
https://lists.freedesktop.org/archives/mesa-dev/2017-March/146581.html

Regards,

Fabio Estevam
