From: Guo Ren <guoren@kernel.org>
Date: Sun, 14 Jul 2019 07:57:27 +0800
Subject: [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for
 ork1 (openrisc)
In-Reply-To: <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
 <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
Message-ID: <CAJF2gTQ85czGP5BAMgn5kwbJKGTmxwAakkZGmUomquTugSwMcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 14, 2019 at 5:24 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/06/2019 12:07, Giulio Benetti wrote:
> > openrisc support has been added with gcc 9.1.
> > Keep for now the old gcc 5 fork for ork1.
>
>  So, when will we remove this?
>
>  Same for ARC (GCC 8.x fork) and C-SKY (GCC 6.x fork): they are available in
> GCC9, do we need to keep those old forks?
Keep the fork for C-SKY, the upstream of csky backend in gcc9 only
support abiv2.

>
>  Regards,
>  Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
