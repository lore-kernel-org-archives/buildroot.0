From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 21:41:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/policycoreutils: fix build with
 NLS
In-Reply-To: <20191014172029.21109-1-fontaine.fabrice@gmail.com>
References: <20191014172029.21109-1-fontaine.fabrice@gmail.com>
Message-ID: <20191014214117.4a4224c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 19:20:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/43b5580fa9f26eac71afa9f3cca413f2791c054d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/policycoreutils/policycoreutils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
