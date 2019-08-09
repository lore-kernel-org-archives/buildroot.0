From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:40:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua-cqueues: bump to version
 20190731
In-Reply-To: <20190809121727.31629-1-fontaine.fabrice@gmail.com>
References: <20190809121727.31629-1-fontaine.fabrice@gmail.com>
Message-ID: <20190809224047.3fc0f1ff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 14:17:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add hash for license file
> - Fix build failure with gcc 9
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f44ceb1fced5102cd7b15e8a054a8937a8cbca95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lua-cqueues/lua-cqueues.hash | 3 ++-
>  package/lua-cqueues/lua-cqueues.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

We normally don't take version bumps in master now. However, this one
fixes a build issue, and I looked at the list of commits between the
two versions, and there aren't a lot of changes, and most of them seem
to be bug and build fixes.

So I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
