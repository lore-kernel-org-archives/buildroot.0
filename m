From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 27 Oct 2013 13:54:49 +0100
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <526CFA77.6010609@mind.be>
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
 <526CFA77.6010609@mind.be>
Message-ID: <526D0D19.1070905@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/10/2013 12:35, Arnout Vandecappelle a ?crit :

>  So, Eric, could you include in your systemd bump a
> 
> depends on !BR2_TOOLCHAIN_USES_UCLIBC
> 
> (with appropriate comment).

This sounds reasonable. Will do!
