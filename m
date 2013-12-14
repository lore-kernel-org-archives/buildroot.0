From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 14 Dec 2013 12:52:22 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
Message-ID: <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Current status:

On Fri, Dec 6, 2013 at 10:02 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> Here is the session 3 of the patchwork cleanup. For those who haven't
> followed previous sessions, here is a quick recap: every session we'll
> be posting the list of the 10 oldest patches, with the original patch
> contributors in copy. During two weeks, we have the opportunity to
> discuss the patch, whether it is still necessary or not, how it should
> be changed to be merged.
>
> In particular, I'm interested in knowing if the original contributor is
> still interested by the patch, or if someone else is interested in
> adopting the patch and sending an updated version, or if the patch no
> longer makes sense due to other changes made in Buildroot.
>
> All patches that have not received any comment or attention before the
> deadline will be removed from patchwork. This is aggressive, but we have
> many 'dead' patches sitting in patchwork, and this cannot work.
>
> Deadline for this session is December 20.
>
> Below are the 10 oldest patches (obtained with a slightly modified
> version of pwclient):
> [ pwclient list -s New -n 10 ]
>
> iucode-tool: new package
> Richard Braun <rbraun@sceen.net>
> http://patchwork.ozlabs.org/patch/185420

No feedback yet.

>
> [3/3] mplayer: Fix DVD support
> Valentine Barshak <gvaxon@gmail.com>
> http://patchwork.ozlabs.org/patch/187437
>

No feedback yet.

> pkg-infra: produce legal info for proprietary packages
> Richard Braun <rbraun@sceen.net>
> http://patchwork.ozlabs.org/patch/187775

I will try to look into this. I brought up this issue before, too.

>
> intel-microcode: new package
> Richard Braun <rbraun@sceen.net>
> http://patchwork.ozlabs.org/patch/187776

No feedback yet.

>
> [1/2] Makefile: Fix target-purgelocales
> Valentine Barshak <gvaxon@gmail.com>
> http://patchwork.ozlabs.org/patch/188623
>
> [2/2] Makefile: Add /usr/lib/locale to target-purgelocales
> Valentine Barshak <gvaxon@gmail.com>
> http://patchwork.ozlabs.org/patch/188624

I tested these patches and provided some comments to Valentine. It
seems there is already something broken in buildroot locale support,
partially fixed by these patches, but not entirely.

>
> rpm5
> Alexander Khryukin <alexander@mezon.ru>
> http://patchwork.ozlabs.org/patch/190962

No feedback yet.

>
> putty: UNIX port of the famous Telnet and SSH GUI client
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/191204

No feedback yet.

>
> new pkg tor
> dev0 <matzeton@googlemail.com>
> http://patchwork.ozlabs.org/patch/193560

I received private feedback from 'dev0' saying that he is no longer
interested in this patch, so I will mark this as Rejected. However,
don't hesitate to adopt this patch if it is useful to you...

>
> [PATCHv3] QtSerialPort: new package
> Thiago Correa <thiago.correa@gmail.com>
> http://patchwork.ozlabs.org/patch/195057

No feedback yet.

Any further feedback on these patches (even saying that you no longer
care) is greatly appreciated...

Thanks,
Thomas
