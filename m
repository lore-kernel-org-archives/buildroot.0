From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:31:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: fix hash of
 license file
In-Reply-To: <20200106220151.3380004-1-fontaine.fabrice@gmail.com>
References: <20200106220151.3380004-1-fontaine.fabrice@gmail.com>
Message-ID: <20200106233155.28e26b32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 23:01:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 0161899ae56d2c886df890ae352665bb07c88869 forgot to update hash of
> license file (update in year):
> https://github.com/docker/engine/commit/68906e6dcdd115be8b12913a7d1c4d9c4db6c495
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3d1ccae5f3e4eeed9a3bf2eb29fd194b868bc0a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
