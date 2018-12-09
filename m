From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:24:53 +0100
Subject: [Buildroot] [PATCH v3 3/9] package/asterisk: bump version to
 16.0.0
In-Reply-To: <20181014090202.31122-3-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
 <20181014090202.31122-3-bernd.kuhls@t-online.de>
Message-ID: <20181209222453.7c067e15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Oct 2018 11:01:55 +0200, Bernd Kuhls wrote:
> - removed patches applied upstream, re-numbered remaining patches
> - not available for static builds anymore:
>   https://github.com/asterisk/asterisk/commit/8e36064109b6fabc6cd8caa59e48f9b523c7485b
> - fixed license hashes after upstream whitespace removal
>   https://github.com/asterisk/asterisk/commit/fd0ca1c3f9b972a52d48a82b492fd6bac772dc78
> - removed configure options not provided by upstream anymore
> - fixed configure error, the file is included in asterisk source:
>     checking for bridges/bridge_softmix/include/hrirs.h... configure:
>     error: cannot check for file existence when cross compiling
> - added "-without-pjproject-bundled" as noted in
>   https://wiki.asterisk.org/wiki/display/AST/New+in+15
> - upstream switched from ncurses to libedit:
>   https://github.com/asterisk/asterisk/commit/d6fda173a40e078db219e9aaceb7f3ce9ba1b4e4
> - added libatomic when needed
> - updated core sound package
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: added libatomic when needed, added dependency on !BR2_STATIC_LIBS
> v2: initial revision

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
