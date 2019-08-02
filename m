From: Guo Ren <guoren@kernel.org>
Date: Fri, 2 Aug 2019 11:38:44 +0800
Subject: [Buildroot] [git commit] package/gcc: drop negative conditions
 on C-SKY for older versions
In-Reply-To: <20190801081630.42287811EE@busybox.osuosl.org>
References: <20190801081630.42287811EE@busybox.osuosl.org>
Message-ID: <CAJF2gTQrzxpWDx+=-rRe+=Jiz_J5u+-FvQMQLGMX7dYA5Q=70g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Fri, Aug 2, 2019 at 12:00 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> commit: https://git.buildroot.net/buildroot/commit/?id=f9d70202c1e09a7a02645638762f60434fd73051
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Now that the C-SKY architecture requires gcc-9, we can drop the special
> conditions on the individual older versions.
In fact, we still use gcc-6.3 on github/c-sky/gcc. GCC-9 is not
recommended for using.

All I test is based on gcc-6.3

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
