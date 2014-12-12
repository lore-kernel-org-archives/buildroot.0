From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Fri, 12 Dec 2014 13:43:29 -0800
Subject: [Buildroot] [PATCH v2 1/1] mtr: bump to version 0.86 and use
 github call
In-Reply-To: <548876B8.6060104@imgtec.com>
References: <1418177455-27127-1-git-send-email-vsergeev@kumunetworks.com>
 <1418177637-28038-1-git-send-email-vsergeev@kumunetworks.com>
 <548876B8.6060104@imgtec.com>
Message-ID: <CAPyrzo1wDQLBA7fQsU8jXmDXmfJ68F7+3fhaWcQrEhypg0S5rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

Thanks, sure. I'll look out for stale configure options and keep things in
sync with patchwork next time around.

Thanks,
~vsergeev
Ivan Sergeev

On Wed, Dec 10, 2014 at 8:37 AM, Vicente Olivert Riera <
Vincent.Riera@imgtec.com> wrote:

> Dear Ivan Sergeev,
>
> just a few things:
>
> On 12/10/2014 02:13 AM, Ivan Sergeev wrote:
> >  MTR_CONF_OPTS = --without-gtk --without-glib
>
> The '--without-glib' option doesn't exist in the configure script. You
> can remove it.
>
> Also, while you are doing the version bump, why not adding a hash file
> as well:
>
>
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash
>
> Could you please mark the previous versions of this patch as
> 'superseded' in patchwork?
>
> And finally, could you please state what changes you make between versions?
>
> Best regards,
> --
> Vicente Olivert Riera
> Graduate Software Engineer, MIPS Platforms
> Imagination Technologies Limited
> t: +44 (0)113 2429814
> www.imgtec.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141212/3f243b6c/attachment-0001.html>
