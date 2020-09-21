From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:42:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: renumber patches
In-Reply-To: <20200920143036.1430126-1-fontaine.fabrice@gmail.com>
References: <20200920143036.1430126-1-fontaine.fabrice@gmail.com>
Message-ID: <20200921224213.15e50f6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 16:30:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 415765b5a8861f3b7e86e9786bf903a5a4d09e73 removed the second patch
> without renumbering the remaining ones
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...{0003-fix-CVE-2015-1419.patch => 0002-fix-CVE-2015-1419.patch} | 0
>  ...D-handler.patch => 0003-Prevent-hang-in-SIGCHLD-handler.patch} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/vsftpd/{0003-fix-CVE-2015-1419.patch => 0002-fix-CVE-2015-1419.patch} (100%)
>  rename package/vsftpd/{0004-Prevent-hang-in-SIGCHLD-handler.patch => 0003-Prevent-hang-in-SIGCHLD-handler.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
