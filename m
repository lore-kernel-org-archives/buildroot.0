From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 00:22:47 +0200
Subject: [Buildroot] [PATCH v4 1/2] package/checksec: new package
In-Reply-To: <1534209477-11544-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534209477-11544-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180821002247.1643a94c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 20:17:56 -0500, Matt Weber wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This patch adds host-checksec package support. This tool provides a
> script to offline check the properties of a security hardened elf file.
> 
> REF: https://github.com/slimm609/checksec.sh
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

The entry to the DEVELOPERS file was missing. I added it, with both
your name and Paresh's name.

Applied to next with this change, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
