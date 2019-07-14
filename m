From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:07:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libplatform: bump to version
 1eb12b1b1efa6747c1e190964854e9e267e3a1e2
In-Reply-To: <20190707082914.18743-1-fontaine.fabrice@gmail.com>
References: <20190707082914.18743-1-fontaine.fabrice@gmail.com>
Message-ID: <20190714160757.34fca18c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jul 2019 10:29:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-p8-platform-config-fix-lookup-paths.patch | 38 -------------------
>  package/libplatform/libplatform.hash          |  3 +-
>  package/libplatform/libplatform.mk            |  2 +-
>  3 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
