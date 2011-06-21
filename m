From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 21 Jun 2011 14:12:01 -0400
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper.c: Handle an
 arbitrary amount of arguments
In-Reply-To: <BANLkTim9Hm8zyVDSs5_cfu-fWh2Z=z3Xtw@mail.gmail.com>
References: <1308649845-21724-1-git-send-email-daniel.nystrom@timeterminal.se>
 <BANLkTim9Hm8zyVDSs5_cfu-fWh2Z=z3Xtw@mail.gmail.com>
Message-ID: <BANLkTi=QFr+OtRR-LYzkdMTO9QmxTcwihg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 21, 2011 at 13:47, Bj?rn Forsman wrote:
> Would you mind checking for args == NULL here, to avoid possible
> segfault on the next line (...and invalid free() later)? Thanks!

free(NULL) is not invalid, it's a nop
-mike
