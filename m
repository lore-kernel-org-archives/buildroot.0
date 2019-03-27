From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 20:12:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/qjson: drop Qt4 patch
In-Reply-To: <20190326215240.15027-1-fontaine.fabrice@gmail.com>
References: <20190326215240.15027-1-fontaine.fabrice@gmail.com>
Message-ID: <20190327201246.5a822e40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Mar 2019 22:52:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Now that Qt4 has been removed, drop patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Qt4-package-error-in-CMakeLists.txt.patch | 26 -------------------
>  1 file changed, 26 deletions(-)
>  delete mode 100644 package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
