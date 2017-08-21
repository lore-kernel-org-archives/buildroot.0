From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Aug 2017 00:06:24 +0200
Subject: [Buildroot] [PATCH] linux-firmware: Add QLogic FC Adapters
In-Reply-To: <20170816043023.6370-1-sam@mendozajonas.com>
References: <20170816043023.6370-1-sam@mendozajonas.com>
Message-ID: <20170822000624.081bc693@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 14:30:23 +1000, Samuel Mendoza-Jonas wrote:
> Add a config option to install the ql2xxx firmware binaries for QLogic
> Fibre Channel adapters.
> Since this doesn't quite fit under the existing categories in Config.in,
> include it under a new category named "Fibre Channel Adapter Firmware".
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
> Very open to suggestion about the category, just saw that it didn't
> really fit under any of the existing headings.

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
