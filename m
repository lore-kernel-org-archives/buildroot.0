From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 10:10:01 +0200
Subject: [Buildroot] [PATCH] package/python3: fix host and target
 legal-info failure
In-Reply-To: <20190411080210.6791-1-giulio.benetti@micronovasrl.com>
References: <20190411080210.6791-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190411101001.56782f85@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Thu, 11 Apr 2019 10:02:10 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> After version bump LICENSE sha256 was not recalculated and generates
> python3-legal-info and host-python3-legal-info failure.
> 
> Update package hash file with new locally calculated sha256.
> 
> Fixes:
> http://autobuild.buildroot.net/results/741/741c1d7ea94ff875420af0bd417dbfe737487750/
> http://autobuild.buildroot.net/results/615/615286c1b71a74279e156b05c6e34694bf9ea5de/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Please rebase on the latest master before sending patches :-) This
issue was already fixed ~2h ago.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
