From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:19:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix license hash
In-Reply-To: <20210718192428.2931594-1-fontaine.fabrice@gmail.com>
References: <20210718192428.2931594-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718221904.44dc000c@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 18 Jul 2021 21:24:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit b5ba0119e858f0bdc2683f15dd7758eb08ed1f6a forgot to update hash of
> LICENSE.md (update of LuaFileSystem and year with
> https://github.com/civetweb/civetweb/commit/1178ea98ccbf2247c35e33aa1e89e445a651fa01
> https://github.com/civetweb/civetweb/commit/a9fb075fd807bf359e749b4d5928aceda65efbd0)
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/civetweb/civetweb.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
