From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 18:16:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pytrie: bump to version
 0.4.0
In-Reply-To: <20210418203858.3481110-1-fontaine.fabrice@gmail.com>
References: <20210418203858.3481110-1-fontaine.fabrice@gmail.com>
Message-ID: <20210424181622.1ed2e8f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Apr 2021 22:38:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - python 2 support has been dropped since
>   https://github.com/gsakkis/pytrie/commit/a60a601d85a660976f4aaab4cb0efcb15b91263b
> - Use LICENSE instead of PKG-INFO which is available in the official
>   tarball since
>   https://github.com/gsakkis/pytrie/commit/1ba5d547dfbf0d384dd16cf78a2cce91ef69fce8
> - Update indentation in hash file (two spaces)
> 
> https://github.com/gsakkis/pytrie/blob/0.4.0/README.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-pytrie/Config.in          | 1 +
>  package/python-pytrie/python-pytrie.hash | 8 ++++----
>  package/python-pytrie/python-pytrie.mk   | 6 +++---
>  3 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
