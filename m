From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 11:48:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: fix build with NLS
In-Reply-To: <20190420145654.15603-1-fontaine.fabrice@gmail.com>
References: <20190420145654.15603-1-fontaine.fabrice@gmail.com>
Message-ID: <20190421114806.04c05f1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Apr 2019 16:56:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b35dd775015772b0f322f77470debe09d24173ff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkrb5/libkrb5.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
