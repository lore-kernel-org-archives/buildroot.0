From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Jul 2008 16:35:53 +0200
Subject: [Buildroot] [PATCH 3/5] PrBoom: add new package PrBoom
In-Reply-To: <1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <20080724143553.GC4991@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 24, 2008 at 03:21:55PM +0200, Hans-Christian Egtvedt wrote:
>This patch adds a new package PrBoom. PrBoom is a Doom and Doom ][ client which

>diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
>new file mode 100644
>index 0000000..5fec883
>--- /dev/null

please use Makefile.autotools.in
