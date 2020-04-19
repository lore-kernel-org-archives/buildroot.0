From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:36:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/websocketpp: bump to version
 0.8.2
In-Reply-To: <20200419194845.337543-1-fontaine.fabrice@gmail.com>
References: <20200419194845.337543-1-fontaine.fabrice@gmail.com>
Message-ID: <20200419223606.41dc24de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 21:48:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e-make_shared-with-new-in-some-cases.patch | 79 -------------------
>  .../0002-Fix-missed-entries-fix-testing.patch | 66 ----------------
>  package/websocketpp/websocketpp.hash          |  2 +-
>  package/websocketpp/websocketpp.mk            |  2 +-
>  4 files changed, 2 insertions(+), 147 deletions(-)
>  delete mode 100644 package/websocketpp/0001-Replace-make_shared-with-new-in-some-cases.patch
>  delete mode 100644 package/websocketpp/0002-Fix-missed-entries-fix-testing.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
