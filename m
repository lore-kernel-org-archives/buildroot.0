From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:46:22 +0100
Subject: [Buildroot] [PATCH] package/nodejs: requires gcc 4.9
In-Reply-To: <73ae9f7e151366504087d518dbef2e357eb0606b.1552641724.git.baruch@tkos.co.il>
References: <73ae9f7e151366504087d518dbef2e357eb0606b.1552641724.git.baruch@tkos.co.il>
Message-ID: <20190315214622.67859723@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 11:22:04 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> BUILDING.md lists gcc 4.9.4 or newer as build prerequisite. This is
> needed for full C++11 support.
> 
>   https://github.com/nodejs/node/commit/d13a65ad68c429884434cdcd94c52b79a6d69717
> 
> Cc: Daniel Price <daniel.price@gmail.com>
> Reported-by: Boris-Ben Shapiro <erectcrested@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/nodejs/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
