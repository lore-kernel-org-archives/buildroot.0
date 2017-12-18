From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 08:30:20 +0100
Subject: [Buildroot] [PATCH 1/1] tpm-tools: bump to version 1.3.9.1
In-Reply-To: <1513535088-8955-1-git-send-email-yairba@tkos.co.il>
References: <1513535088-8955-1-git-send-email-yairba@tkos.co.il>
Message-ID: <20171218083020.4b598eb1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In addition to Baruch's comment, another one below.

On Sun, 17 Dec 2017 20:24:48 +0200, Yair Ben Avraham wrote:

>  TPM_TOOLS_AUTORECONF = YES
>  TPM_TOOLS_GETTEXTIZE = YES

Since all the patches are being removed, do we still need
autoconf/gettextize ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
