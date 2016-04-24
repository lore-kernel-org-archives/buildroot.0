From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:54:45 +0200
Subject: [Buildroot] [PATCH v5 3/5] barebox: extract package name
 argument
In-Reply-To: <25e6116304fc372a998f7091f95a08ea91737470.1461489060.git.pieter@boesman.nl>
References: <cover.1461489060.git.pieter@boesman.nl>
 <25e6116304fc372a998f7091f95a08ea91737470.1461489060.git.pieter@boesman.nl>
Message-ID: <20160424175445.1e355e27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 11:18:45 +0200, Pieter Smith wrote:
> No functional changes: Extracts an argument to the inner-barebox-package
> function to automatically determine the uppercase package name. This is needed
> to support a 2nd config build. This results in the following renaming:
>   'BAREBOX' -> '$(1)'
> 
> All barebox packages are meant to be built from the same sources, so related
> KConfig variables (origin, version and patch directory) are not extracted.
> 
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>  boot/barebox/barebox.mk | 121 +++++++++++++++++++++++++-----------------------
>  1 file changed, 62 insertions(+), 59 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
