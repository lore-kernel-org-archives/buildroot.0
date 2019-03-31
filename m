From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 12:15:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/luarocks: better choice of
 modules in generated test
In-Reply-To: <20190331064845.16243-1-francois.perrad@gadz.org>
References: <20190331064845.16243-1-francois.perrad@gadz.org>
Message-ID: <20190331121535.16c975d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 08:48:44 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> the name derived from package name is not suitable,
> so, we search in the built modules.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/buildroot.lua | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
