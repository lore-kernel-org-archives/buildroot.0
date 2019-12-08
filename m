From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:30:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpdf: remove pcre dependency
In-Reply-To: <20191208085143.1358737-1-fontaine.fabrice@gmail.com>
References: <20191208085143.1358737-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208143024.3787c14c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Dec 2019 09:51:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pcre is not needed since version 7.0.0 and
> https://github.com/qpdf/qpdf/commit/9a96e233b051b31289c84f90a321583887b1400a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qpdf/Config.in | 1 -
>  package/qpdf/qpdf.mk   | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
