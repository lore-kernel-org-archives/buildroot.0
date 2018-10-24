From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 Oct 2018 18:37:59 +0200
Subject: [Buildroot] [PATCH] PostgreSQL: bump version to 11.0
References: <20181023171555.18043-1-aduskett@gmail.com>
 <n424afxool.ln2@ID-313208.user.individual.net>
 <CAFSsvmrWpqXHnzo-63j6D3jxCJVRuZgbzmMeX8hFiYqKtpL_Uw@mail.gmail.com>
Message-ID: <7oj6afxmfc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 24 Oct 2018 11:34:08 -0400 schrieb Adam Duskett:

> So either 2 options:
> 
> 1) Explicitly disable llvm using the flag --without-llvm
> 2) Fix llvm detection.

Hi Adam,

unless 2) is easy to achieve we should go for 1).
Personally I prefer 1) because I have no use for JIT.

Regards, Bernd
