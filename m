From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:15:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/bird: fix build with gcc 10
In-Reply-To: <20200815082818.2062142-1-fontaine.fabrice@gmail.com>
References: <20200815082818.2062142-1-fontaine.fabrice@gmail.com>
Message-ID: <20200815161511.1288ca88@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 10:28:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/3e01f490d76be03f21a0680eb162a0c0267fc1b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bird/0002-Added-missing-extern.patch | 34 ++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/bird/0002-Added-missing-extern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
