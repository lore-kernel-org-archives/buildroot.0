From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 30 Mar 2020 21:34:29 +0200
Subject: [Buildroot] [PATCH v2 1/4] Revert "configs/nanopi_neo4: remove
 defconfig"
In-Reply-To: <20200330211745.7f4bb901@windsurf.home>
References: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
 <1585588981-12498-2-git-send-email-marek.belisko@open-nandra.com>
 <20200330211745.7f4bb901@windsurf.home>
Message-ID: <CAAfyv36za=inYO6rWmqmk8_B9x43Q3mGh3hBJJeq8CMLqfCJKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 30, 2020 at 9:17 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 30 Mar 2020 19:22:58 +0200
> Marek Belisko <marek.belisko@open-nandra.com> wrote:
>
> > This reverts commit 8af7b11bd8a95bc41e4de46f727f3b0afde465a4.
> >
> > neo4 config was removed due to the fact that 32 bit toolchain was missing
> > for building AFT and was not added until some time.
> >
> > Recently in commit d9959b647f2afd09e564bddfc3d21476f9a0f669 package
> > was added to return back neo4 config and use this new option.
>
>
> Your Signed-off-by is missing. However, I think a revert is the bad
> approach, indeed this commit by itself is still broken, it needs the
> second patch in your series to work correctly.
>
> So could you instead simply resubmit a new neo4 defconfig ?
You mean squash all other commits to one and post as initial commit
in:d1cd9cdf269488d6adeb0cc6d2250cf6ffe1b3ed
Thanks.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

marek
