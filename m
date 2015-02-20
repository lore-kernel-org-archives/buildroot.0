From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:15:16 +0100
Subject: [Buildroot] [PATCH 0/7] sigrok fixes and pulseview package
In-Reply-To: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150220191516.6976b175@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Fri, 20 Feb 2015 13:28:55 +0100, Bartosz Golaszewski wrote:

> Bartosz Golaszewski (7):
>   libsigrok: remove --disable-udev from CONF_OPTS
>   libserialport: drop untrue statement from Config.in help
>   libsigrok: don't select libserialport in Config.in
>   autoconf-archive: new package
>   libsigrok: bump git commit tag

All these patches applied to next. On the autoconf-archive, I did a few
changes, I'll indicate which ones as a comment to the patch itself.

>   libsigrok: enable building C++ bindings
>   pulseview: new package

For those ones, I have some issues/concerns.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
