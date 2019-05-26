From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 14:50:37 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/gpsd: add skytraq option
In-Reply-To: <20190525141726.27814-1-fontaine.fabrice@gmail.com>
References: <20190525141726.27814-1-fontaine.fabrice@gmail.com>
Message-ID: <20190526145037.2a6c8ed5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 May 2019 16:17:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> skytraq support has been added in version 3.17 with
> https://git.savannah.gnu.org/cgit/gpsd.git/commit/SConstruct?id=1456c9f50e718a394f2b633cf0773f3fd792cdaa
> 
> Allow the user to enable/disable it through an option and disable it by
> default
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gpsd/Config.in | 5 +++++
>  package/gpsd/gpsd.mk   | 3 +++
>  2 files changed, 8 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
