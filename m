From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 14:34:08 +0100
Subject: [Buildroot] [PATCH 1/2] minidlna: add init script for sysv and
 systemd
In-Reply-To: <1424734763-23491-1-git-send-email-aurelien@chabot.fr>
References: <1424734763-23491-1-git-send-email-aurelien@chabot.fr>
Message-ID: <20150308143408.18a8cd0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aur?lien Chabot,

On Tue, 24 Feb 2015 00:39:22 +0100, Aur?lien Chabot wrote:

> +restart() {
> +	stop
> +	start
> +}

I had to add a "sleep 1" in-between here, otherwise minidlnad doesn't
restart properly. If you find a better solution, let me know.

Otherwise, patch applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
