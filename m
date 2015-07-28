From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:19:57 +0200
Subject: [Buildroot] [PATCH v2] jquery-datetimepicker: new package
In-Reply-To: <1438107267-2163-1-git-send-email-yegorslists@googlemail.com>
References: <1438107267-2163-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150728231957.2bf60f53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Tue, 28 Jul 2015 20:14:27 +0200, Yegor Yefremov wrote:

> +JQUERY_DATETIMEPICKER_VERSION = 2.4.5
> +JQUERY_DATETIMEPICKER_SITE = $(call github,xdan,datetimepicker,$(JQUERY_DATETIMEPICKER_VERSION))
> +JQUERY_DATETIMEPICKER_LICENSE = MIT

The source code has a license file, so I've added the
<pkg>_LICENSE_FILES variable here, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
