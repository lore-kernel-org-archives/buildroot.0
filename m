From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:07:13 +0200
Subject: [Buildroot] [PATCH 1/2] zeromq: bump to version 4.1.5
In-Reply-To: <1469295001-21786-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469295001-21786-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723230713.6bf985c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 14:30:00 -0300, Gustavo Zacarias wrote:

> -ZEROMQ_VERSION = 4.1.4
> +ZEROMQ_VERSION = 4.1.5
>  ZEROMQ_SITE = http://download.zeromq.org
> +ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)

Duplicate _SITE variable, so I've dropped the old one and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
