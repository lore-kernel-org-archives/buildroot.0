From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Aug 2014 09:23:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/xscreensaver: fix linking
 with intl
In-Reply-To: <1409008386-21000-1-git-send-email-romain.naour@openwide.fr>
References: <1409008386-21000-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140826092307.3122ca58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 26 Aug 2014 01:13:06 +0200, Romain Naour wrote:

> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT

Have you verified if it's really BR2_NEEDS_GETTEXT or
BR2_NEEDS_GETTEXT_IF_LOCALE that should be used?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
