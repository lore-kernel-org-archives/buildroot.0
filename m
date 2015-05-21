From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 20:10:21 +0200
Subject: [Buildroot] [PATCH] package/sqlite: fix parallel build failures
In-Reply-To: <20150521180609.GA4244@free.fr>
References: <1432159112-28325-1-git-send-email-yann.morin.1998@free.fr>
 <20150521120742.0b0d7fdc@free-electrons.com>
 <20150521180609.GA4244@free.fr>
Message-ID: <20150521201021.111da6b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 21 May 2015 20:06:10 +0200, Yann E. MORIN wrote:

> Full story:
> 
>   - sqlite uses fossil as its VCS;
> 
>   - cloning a fossil repo creates a single file (the DB) in the current
>     directory;
> 
>   - "checking out" the repository is also done in the curent directory,
>     polluting it;
> 
>   - there is no "fossil log" command;
> 
>   - the content of the fossil repository is clearly not aligned with
>     that of the tarball;
> 
>   - there is autostuff in the repository, but it is in a sub-dorectory,
>     and there is no explanation on how to use it; there is no explanation
>     on how to generate the archive from the repository;
> 
>   - the mailing list are not very newbie-friendly: they are
>     subscription-only (OK) but even the archives require subscription to
>     be browsed (not OK).
> 
> So, in the end, I just threw in the towel...

Seems fun :)

Maybe you could just send a mail to the mailing list to report the bug,
as suggested at https://www.sqlite.org/src/wiki?name=Bug+Reports ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
