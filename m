From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:30:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/jhead: bump to version 3.0.3
In-Reply-To: <20190317153036.27661-1-fontaine.fabrice@gmail.com>
References: <20190317153036.27661-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317173020.480ba8a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 16:30:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jhead/0001-use-ldflags.patch | 16 ----------------
>  package/jhead/jhead.hash             |  3 ++-
>  package/jhead/jhead.mk               |  2 +-
>  3 files changed, 3 insertions(+), 18 deletions(-)
>  delete mode 100644 package/jhead/0001-use-ldflags.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
