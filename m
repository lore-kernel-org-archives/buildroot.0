From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 19:05:40 +0200
Subject: [Buildroot] [PATCH 3/4] Makefile: export BUILD_DIR
In-Reply-To: <87y55wruki.fsf@dell.be.48ers.dk>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
 <cover.1381705600.git.yann.morin.1998@free.fr>
 <834cf660ddc6216e486f97195f464f0e6125774e.1381705600.git.yann.morin.1998@free.fr>
 <87y55wruki.fsf@dell.be.48ers.dk>
Message-ID: <20131014170540.GB3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-10-14 12:54 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> $(BUILD_DIR) is a nice place to put files generated during the build.
>  Yann> With the advent of user-supplied step-hooks, they may want to store
>  Yann> some information on the build.
> 
>  Yann> Export BUILD_DIR to that effect.
> 
> Looks good, but please also update the documentation in
> docs/manual/customize-rootfs.txt.

Ah, yes. Done. Thanks!

Don't forget this pull-request is only an RFC from my point-of-view,
aimed at a starting point for further discussion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
