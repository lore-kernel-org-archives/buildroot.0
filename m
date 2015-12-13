From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:40:15 +0100
Subject: [Buildroot] [PATCH 5/8] package/dovecot-pigeonhole: bum version
 to 0.4.10.rc2
In-Reply-To: <1449945103-23715-5-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
 <1449945103-23715-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213144015.20a1d4f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 12 Dec 2015 19:31:40 +0100, Bernd Kuhls wrote:

> -DOVECOT_PIGEONHOLE_VERSION = 0.4.9
> +DOVECOT_PIGEONHOLE_VERSION = 0.4.10.rc2
>  DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
> -DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
> +DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2/rc

We normally don't package release candidate versions. But since it's
needed by the new dovecot version, and I guess there will be a final
release soon, I've applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
