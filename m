From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:49:39 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/open2300: use mysql_config to retrieve cflags and libs
In-Reply-To: <20200714211017.2421936-1-fontaine.fabrice@gmail.com>
References: <20200714211017.2421936-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714234939.31de8609@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 23:10:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> oracle-mysql won't built its own bundled zlib since commit
> 6fed83a03047535d4a9c849352f8c21b30177fcd so don't unconditionally link
> with zlib instead use mysql_config to retrieve cflags and libs as
> suggested by Thomas Petazzoni in review of first iteration
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Use mysql_config instead of current workarounds

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
