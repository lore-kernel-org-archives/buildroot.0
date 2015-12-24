From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:05:46 +0100
Subject: [Buildroot] [PATCH v3 07/13] package/dhcp: fix SysV init
 scripts output text
In-Reply-To: <1445734779-7212-7-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-7-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151224150546.7bfd9ca4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 25 Oct 2015 02:59:33 +0200, Beno?t Th?baudeau wrote:
> From: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> Fix various messages displayed by these scripts:
>  - remove extra "dhcpd3" for `S80dhcp-server stop`,

I had already done this change in a previous commit.

>  - make start-stop-daemon quiet in order to avoid extra messages like
>    "stopped /usr/sbin/dhcpd (pid 174)" being output between the command
>    description and its result,
>  - fix the script names in the usage strings.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

So, I've applied your patch, after adjusting it to not do the dhcpd3
removal.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
