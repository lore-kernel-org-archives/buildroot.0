From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:42:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 9.52
In-Reply-To: <20200817185109.3051830-1-fontaine.fabrice@gmail.com>
References: <20200817185109.3051830-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818164222.7d201b2c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 20:51:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix a bunch of CVEs: CVE-2020-16287, CVE-2020-16288, CVE-2020-16289,
> CVE-2020-16290, CVE-2020-16291, CVE-2020-16292, CVE-2020-16293,
> CVE-2020-16294, CVE-2020-16295, CVE-2020-16296, CVE-2020-16297,
> CVE-2020-16298, CVE-2020-16299, CVE-2020-16300, CVE-2020-16301,
> CVE-2020-16302, CVE-2020-16303, CVE-2020-16304, CVE-2020-16305
> CVE-2020-16308, CVE-2020-16309, CVE-2020-17538
> 
> PKGCONFIG must be passed since version 9.51 and
> https://github.com/ArtifexSoftware/ghostpdl/commit/2d84ecc57837785b566ebd9d5909ba9edc9d697f
> 
> Also drop patch (already in version) and update indentation in hash file
> (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...emory-Corruption-in-Ghostscript-9-52.patch | 54 -------------------
>  package/ghostscript/ghostscript.hash          |  6 +--
>  package/ghostscript/ghostscript.mk            |  8 ++-
>  3 files changed, 6 insertions(+), 62 deletions(-)
>  delete mode 100644 package/ghostscript/0002-Bug-702582-CVE-2020-15900-Memory-Corruption-in-Ghostscript-9-52.patch

Amazing list of CVEs! Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
