From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 23:30:02 +0100
Subject: [Buildroot] [PATCH] package/busybox: update .config file with
 Busybox 1.31.1
In-Reply-To: <20200120075539.3071-1-joerg.krause@embedded.rocks>
References: <20200120075539.3071-1-joerg.krause@embedded.rocks>
Message-ID: <20210105233002.25ec5f6d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?rg,

On Mon, 20 Jan 2020 08:55:38 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Commit 5530674e0ce21a927735ff77602a9e5854363751 bumped the version, but
> did not update the config file.
> 
> Update the configuration file by loading the busybox.config file and
> saving it back.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Sorry for the long delay. Could you update this patch based on the
current version of Busybox in Buildroot (1.32.0) as well as
https://patchwork.ozlabs.org/project/buildroot/patch/20200120075539.3071-2-joerg.krause at embedded.rocks/.
Also there is a Busybox 1.32.1 which we might want to update to. 1.33.0
is out, but considered a development release.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
