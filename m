From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:44:59 +0100
Subject: [Buildroot] [PATCH v2] board: add support for Freescale i.MX6UL
 Evaluation Kit
In-Reply-To: <1454110911-28705-1-git-send-email-romain.naour@gmail.com>
References: <1454110911-28705-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160131234459.3e52ffa8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Julien,

On Sat, 30 Jan 2016 00:41:51 +0100, Romain Naour wrote:

> +RET=${?}
> +exit ${RET}

I simplified this to "exit $?" and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
