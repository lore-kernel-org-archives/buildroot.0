From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:25:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/git-crypt: fix build with
 gcc-4.9
In-Reply-To: <20180820194056.22107-1-bernd.kuhls@t-online.de>
References: <20180820194056.22107-1-bernd.kuhls@t-online.de>
Message-ID: <20180820222524.521d6c47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 21:40:56 +0200, Bernd Kuhls wrote:
> Fixes
> 
> In file included from commands.cpp:32:0:
> crypto.hpp:60:7: error: 'unique_ptr' in namespace 'std' does not name a template type
>   std::unique_ptr<Aes_impl> impl;
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/git-crypt/git-crypt.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
