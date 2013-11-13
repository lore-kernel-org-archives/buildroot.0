From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Nov 2013 22:37:54 +0100
Subject: [Buildroot] [PATCH v3 2/5] sysvinit: depend on SysV selected as
 init system.
In-Reply-To: <1383752078-25315-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1383752078-25315-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131113223754.5fbe6f94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed,  6 Nov 2013 16:34:35 +0100, Eric Le Bihan wrote:
> In order to prevent sysvinit and systemd to be selected at the same
> time, sysvinit can now only be selected if SysV is chosen as init
> system.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
