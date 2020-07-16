From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 23:06:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: bump to version 4.94
In-Reply-To: <20200716194011.1961006-1-fontaine.fabrice@gmail.com>
References: <20200716194011.1961006-1-fontaine.fabrice@gmail.com>
Message-ID: <20200716230657.6e1de9f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 21:40:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop seventh patch (already in version with
>   https://git.exim.org/exim.git/commitdiff/302e7912253bd1f1a88f04d9a8a71d8a3c9b93fc)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-version.-h-sh-generation-with-para.patch | 84 -------------------
>  package/exim/exim.hash                        | 10 +--
>  package/exim/exim.mk                          |  4 +-
>  3 files changed, 7 insertions(+), 91 deletions(-)
>  delete mode 100644 package/exim/0007-Makefile-Base-fix-version.-h-sh-generation-with-para.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
