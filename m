From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/kompexsqlite: use github macro
In-Reply-To: <20190914145242.8633-1-fontaine.fabrice@gmail.com>
References: <20190914145242.8633-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915144102.4c7ba997@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Sep 2019 16:52:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use github macro and drop SOURCE variable to keep the default SOURCE
> value which gives a much more sensible tarball name
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kompexsqlite/kompexsqlite.hash | 2 +-
>  package/kompexsqlite/kompexsqlite.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
