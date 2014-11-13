From: Bryce Schober <bryce.schober@gmail.com>
Date: Wed, 12 Nov 2014 18:16:06 -0800
Subject: [Buildroot] out-of-tree kernel modules and linux header versions
In-Reply-To: <CAJpxd07isuV8UB+d2pWCjoYsdWnG7T5XM_Hm6vxyrTJi_gz9DQ@mail.gmail.com>
References: <CAJpxd07isuV8UB+d2pWCjoYsdWnG7T5XM_Hm6vxyrTJi_gz9DQ@mail.gmail.com>
Message-ID: <CAJpxd06Luke+9Jgd7+Ka68yUwUh1Lxu93dfhJcG_-LzZ+irVqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 12, 2014 at 5:53 PM, Bryce Schober <bryce.schober@gmail.com>
wrote:

> I see that there have been quite a few changes to the external toolchain
> wrapper since 2011.08, so maybe I'll see if I can back-port it to my old
> buildroot...
>

Ugh. Yeah, that's not really gonna work, I think. There are way too many
changes in buildroot make infrastructure since then.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/c1ce48ee/attachment.html>
