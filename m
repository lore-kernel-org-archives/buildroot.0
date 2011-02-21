From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 21 Feb 2011 18:02:53 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux.mk: depend on actual kernel
 image instead of stamp file
In-Reply-To: <1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
	<1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTinKTFAOsP-0EUrVcFgAxntLpkhzN1EVZMapdJjW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/18 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> Use the real output file (kernel image) as target instead of a stamp
> file. This way Buildroot cannot be tricked into thinking that the kernel
> image is installed when it's not.
>
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
> ?linux/linux.mk | ? ?8 ++++----
> ?1 files changed, 4 insertions(+), 4 deletions(-)

Ping?
