From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:51:12 +0200
Subject: [Buildroot] [PATCH v2] package/clang: delete unnecessary files
 from target
In-Reply-To: <20180502100438.743-1-valentin.korenblit@smile.fr>
References: <20180502100438.743-1-valentin.korenblit@smile.fr>
Message-ID: <20180502145112.4417c41e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 12:04:38 +0200, Valentin Korenblit wrote:
> Delete:
> 	Binaries in: /usr/bin
> 		     /usr/libexec
> 
> 	Directories: /usr/lib/clang
> 		     /usr/share/clang
> 		     /usr/share/opt-viewer
> 		     /usr/share/scan-build
> 		     /usr/share/scan-view
> 
> 	Manual:	     /usr/share/man/man1/scan-build.1
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
> Changes v1 -> v2:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
