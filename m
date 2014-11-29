From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 28 Nov 2014 20:48:17 -0800
Subject: [Buildroot] [PATCH v2 00/13] Add Xorg support for imx6
In-Reply-To: <18420074.Oyhpzo8KGq@sagittea>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
 <20141116083345.GA8150@n411z>
 <CADCpmyNT+VH8==NvuJm8wOZ3xSa4Xjm6QJaRFm_TZduihhA05g@mail.gmail.com>
 <18420074.Oyhpzo8KGq@sagittea>
Message-ID: <CADCpmyP+F36SF4Jy7L+hJ9h3NVzDx-JvqgC50deeXmDgRQVspQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerome, all,

On Sun, Nov 16, 2014 at 2:33 PM, J?r?me Pouiller <jezz@sysmic.org> wrote:
>> > [snip]
>> > However I have a few questions regarding the patches:
>> > - 05/13: gpu-viv-bin-mx6q: make fb/x11 choice explicit
>> >
>> >   - Not sure to get the use case here. Are people interested in having
>> >   fb libs on a X system?
> In fact, yes I think. During development, many developers try fb and Xorg to
> know which one match best for theirs objectives. I think, it is easy to make a
> mistakes without this patch.
>
> In add, I think I will add wayland support in future. I found easier to select
> explicitly back-end.
>

Ok I now get it.

>> > - 06/13: gpu-viv-bin-mx6q: change output selection mecanism
>> >
>> >   - s/mecanism/mechanism
>> >   - Are the symbolic links changes related to the output selection? I
>> >   would
>> >   have seen this as part of the "04/13: gpu-viv-bin-mx6q: fix GLESv2
>> >   support"
>> >   patch
>
> Patch 04 fix a bug, while patch 06 is a style change. However, I admit patch
> description is not well chosen.
>
>> > Other than that it looks good. There's one test I haven't done yet:
>> > rebuild a system without X making sure 3D is still working.

Sorry for the delay but I've finally tested your patchset without X
(fb mode) and everything works fine!
Let me know if there's more testing to be done, it'd be great to have
the latest GPU libs merged asap.

Thanks,
Gary
