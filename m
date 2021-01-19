From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2021 18:59:20 +0100
Subject: [Buildroot] [PATCH] packages: carry site-method archive format
 version when overriding _SOURCE
In-Reply-To: <20210118224005.4ecd8ee3@windsurf.home>
References: <20210118181612.77863-1-yann.morin.1998@free.fr>
 <20210118224005.4ecd8ee3@windsurf.home>
Message-ID: <20210119175920.GX2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-18 22:40 +0100, Thomas Petazzoni spake thusly:
> On Mon, 18 Jan 2021 19:16:12 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Fix that by manually propagating the per-site-method format-version.
> I find it not so nice that this "internal" detail has to creep in all
> the way up to barebox.mk and linux-headers.mk,

Neither do I, neither do I... Guess what I'm working on...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
