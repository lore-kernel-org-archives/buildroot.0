From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 16 Apr 2012 18:07:59 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: patch pattern was
	expanded prematurely
In-Reply-To: <1334592173-12495-1-git-send-email-ludovic.desroches@atmel.com>
References: <4F8C4224.6040500@atmel.com>
 <1334592173-12495-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <4F8C43DF.6040803@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/16/2012 06:02 PM, ludovic.desroches at atmel.com a ?crit :
> From: Ludovic Desroches<ludovic.desroches@atmel.com>
>
> The patch pattern was expanded before being into the patch directory so the
> expansion add incorrect files.
>

sorry for the typo: the expansion can add incorrect files.

Regards

Ludovic
