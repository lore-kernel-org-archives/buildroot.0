From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:04:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: fix build with cmake < 3.10
In-Reply-To: <20191002175120.9238-1-fontaine.fabrice@gmail.com>
References: <20191002175120.9238-1-fontaine.fabrice@gmail.com>
Message-ID: <20191002210454.1cf48970@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 19:51:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/991dd1d74f00f027a905d2ec3ad1a1b2b723f978
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/znc/znc.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
