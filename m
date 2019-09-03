From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Sep 2019 10:38:09 +0200
Subject: [Buildroot] [PATCH] less: set PAGER variable
In-Reply-To: <20190902133955.9541-1-lkundrak@v3.sk>
References: <20190902133955.9541-1-lkundrak@v3.sk>
Message-ID: <20190903103809.1d52ff66@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Sep 2019 15:39:55 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> The system/skeleton/etc/profile sets PAGER to /bin/more. Not sure why,
> but this defeats pager autodetection by various tool (systemctl, nmcli,
> etc.) that would otherwise prefer less to more.

Perhaps we should simply remove the PAGER definition in etc/profile, then ?

In any case, your patch lacks an SoB.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
