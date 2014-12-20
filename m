From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:48:14 +0100
Subject: [Buildroot] [PATCH] strongswan: bump to version 5.2.1
In-Reply-To: <1418691367-12528-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418691367-12528-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141220214814.2f2f0521@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 15 Dec 2014 21:56:07 -0300, Gustavo Zacarias wrote:

> -config BR2_PACKAGE_STRONGSWAN_TOOLS
> -	bool "Enable additional utilities (openac, scepclient and pki)"

You're removing this option. Shouldn't it be added to Config.in.legacy,
for proper legacy handling?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
