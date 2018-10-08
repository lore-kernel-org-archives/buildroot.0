From: Mario Lang <mlang@blind.guru>
Date: Mon, 08 Oct 2018 10:18:08 +0200
Subject: [Buildroot] [PATCH 1/1] brltty: fix build on mips64el
In-Reply-To: <20180930183408.4248-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 30 Sep 2018 20:34:08 +0200")
References: <20180930183408.4248-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm84g8cf.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

> Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
> version 5.5.
>
> Indeed, third patch was merged upstream but it was then reverted:
> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
>
> Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
> was renamed into MKREL. So, instead of patching again brltty, overwrite
> LD to set the correct emulation depending on MIPS architecture as
> already done in linux-tool-perf.mk.in.

Thanks Fabrice.  ack and +1.

-- 
CYa,
  ?????
