From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Wed, 20 Aug 2014 09:33:02 +0200
Subject: [Buildroot] [PATCH] package/infra: fix downloading versions
	with a slash
In-Reply-To: <1408468875-6811-1-git-send-email-yann.morin.1998@free.fr>
References: <1408468875-6811-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <53F44F2E.2010406@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/19/2014 07:21 PM, Yann E. MORIN wrote:
> Make the _DL_VERSION variables immediately-evaluated.
> 
> Fixes:
>     https://bugs.busybox.net/show_bug.cgi?id=7328

Hi,

I re-checked manually this patch, and let my continuous integration jobs
run with it during the night: everything is fine. Thanks again!

  Tested-by: Vincent Stehl? <vincent.stehle@freescale.com>

Best regards,

V.
