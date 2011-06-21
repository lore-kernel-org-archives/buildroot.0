From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 22 Jun 2011 00:22:05 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper.c: Handle an
 arbitrary amount of arguments
In-Reply-To: <BANLkTi=QFr+OtRR-LYzkdMTO9QmxTcwihg@mail.gmail.com>
References: <1308649845-21724-1-git-send-email-daniel.nystrom@timeterminal.se>
 <BANLkTim9Hm8zyVDSs5_cfu-fWh2Z=z3Xtw@mail.gmail.com>
 <BANLkTi=QFr+OtRR-LYzkdMTO9QmxTcwihg@mail.gmail.com>
Message-ID: <BANLkTinRzg-CHke9yF8Fm_i==JAgGqhECA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 June 2011 20:12, Mike Frysinger <vapier@gentoo.org> wrote:
> free(NULL) is not invalid, it's a nop

I didn't know. Thanks!
