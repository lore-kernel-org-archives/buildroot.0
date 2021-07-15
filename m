From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:52:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix tarball hash
In-Reply-To: <20210705051445.3496122-1-fontaine.fabrice@gmail.com>
References: <20210705051445.3496122-1-fontaine.fabrice@gmail.com>
Message-ID: <20210715215245.024e7705@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon,  5 Jul 2021 07:14:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Tarball hash added by commit 1054a7aaa238253db8b60e4a520a66ad9e1b1eb1 is
> wrong
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1ed64d9a2a707cbd06f9d2af29101b70b668bc06
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
