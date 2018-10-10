From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:05:23 +0200
Subject: [Buildroot] [PATCH] lua-*: fix upstream URL in Config.in
In-Reply-To: <20181010065610.19680-1-francois.perrad@gadz.org>
References: <20181010065610.19680-1-francois.perrad@gadz.org>
Message-ID: <20181010090523.78dc0183@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 08:56:10 +0200, Francois Perrad wrote:
> like in https://git.busybox.net/buildroot/commit/?id=05200ad01434ce297a166c6e1bebc8196c18f7dc
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-coat/Config.in           | 2 +-
>  package/lua-coatpersistent/Config.in | 2 +-
>  package/lua-csnappy/Config.in        | 2 +-
>  package/lua-messagepack/Config.in    | 2 +-
>  package/lua-testmore/Config.in       | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
