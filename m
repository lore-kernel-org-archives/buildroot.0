From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 21:58:52 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
	January 19)
In-Reply-To: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
Message-ID: <CAAXf6LVhGnZrVy7bTPjWa+xjbHtKrHU6pFE8aVmAmjbEB_X46w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Jan 5, 2014 at 5:01 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> Here is the session 5 of the patchwork cleanup. For those who haven't
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
> Deadline for this session is January 19.
>
> Below are the 10 oldest patches (obtained with a slightly modified
> version of pwclient):
> [ pwclient list -s New -n 17 ] (and skip Delegated patches)
>

Here is the conclusion for this session:

>
> tokyocabinet: new package
> Jon Diekema <jon.diekema@gmail.com>
> http://patchwork.ozlabs.org/patch/207827

No feedback: rejected.

>
> [RFC,1/2] barebox: Build barebox in separate directory.
> Marek Belisko <marek.belisko@open-nandra.com>
> http://patchwork.ozlabs.org/patch/207942
>
> [RFC,2/2] barebox: Add possibility to build also barebox xloader (MLO).
> Marek Belisko <marek.belisko@open-nandra.com>
> http://patchwork.ozlabs.org/patch/207943

No feedback. I would tend to reject these two patches, unless someone
still pops up and wants to adopt these patches. They introduce a
second build of barebox: one for the standard barebox, and another one
for the xloader. In fact, the only real difference seems to be that
both builds use a separate config file.

>
> new package: p7zip
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/207947

No feedback: rejected.

>
> toolchain-external: re-introduce Sourcery CodeBench ARM 2010.09
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> http://patchwork.ozlabs.org/patch/207978

No feedback: rejected.

>
> [1/1,v2] Hide issue and hostname menu when using a custom skeleton.
> Sagaert Johan <sagaert.johan@skynet.be>
> http://patchwork.ozlabs.org/patch/211644

Superseded thanks to Yann.

>
> [1/2] new package: python-posix_ipc.
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212498
>
> [2/2] new package: python-posix_ipc
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212499

Both superseded thanks to Matt.

>
> [1/1] added python unicode selection to menu
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212500

v2 submitted and awaiting further review/integration.

>
> [1/2] makebootfat: new package
> Floris Bos <bos@je-eigen-domein.nl>
> http://patchwork.ozlabs.org/patch/213112

Marked as rejected based on feedback from Yann. If someone disagrees,
just let me know...

Best regards,
Thomas
