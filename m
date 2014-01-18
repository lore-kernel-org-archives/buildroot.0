From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 18 Jan 2014 16:35:13 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
	January 19)
In-Reply-To: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
Message-ID: <CAAXf6LXZbXMcBkYbta9_ymfKp0KCB=FkoD+j4BCgLqXZ7+f8ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

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
>
> tokyocabinet: new package
> Jon Diekema <jon.diekema@gmail.com>
> http://patchwork.ozlabs.org/patch/207827
>
> [RFC,1/2] barebox: Build barebox in separate directory.
> Marek Belisko <marek.belisko@open-nandra.com>
> http://patchwork.ozlabs.org/patch/207942
>
> [RFC,2/2] barebox: Add possibility to build also barebox xloader (MLO).
> Marek Belisko <marek.belisko@open-nandra.com>
> http://patchwork.ozlabs.org/patch/207943
>
> new package: p7zip
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/207947
>
> toolchain-external: re-introduce Sourcery CodeBench ARM 2010.09
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> http://patchwork.ozlabs.org/patch/207978
>
> [1/1,v2] Hide issue and hostname menu when using a custom skeleton.
> Sagaert Johan <sagaert.johan@skynet.be>
> http://patchwork.ozlabs.org/patch/211644
>
> [1/2] new package: python-posix_ipc.
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212498
>
> [2/2] new package: python-posix_ipc
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212499
>
> [1/1] added python unicode selection to menu
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212500
>
> [1/2] makebootfat: new package
> Floris Bos <bos@je-eigen-domein.nl>
> http://patchwork.ozlabs.org/patch/213112
>
>

Sorry that I did not yet send any reminder last week. Here is a quick
one: if you think any of these patches (that did not yet receive
positive feedback) are still needed, let us know.

Thanks,
Thomas
