From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 14:35:33 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/git-crypt: bump version to
 0.6.0
In-Reply-To: <20180819071821.17780-1-bernd.kuhls@t-online.de>
References: <20180819071821.17780-1-bernd.kuhls@t-online.de>
Message-ID: <20180820143533.3f651705@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 09:18:21 +0200, Bernd Kuhls wrote:
> Quoting from release notes:
> https://www.agwa.name/git/git-crypt.git/raw/master/NEWS
> 
> "v0.6.0 (2017-11-26)
>   * Add support for OpenSSL 1.1 (still works with OpenSSL 1.0).
>   * Switch to C++11 (gcc 4.9 or higher now required to build).
>  [...]"
> 
> Added license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/git-crypt/Config.in      | 6 ++++--
>  package/git-crypt/git-crypt.hash | 7 +++++--
>  package/git-crypt/git-crypt.mk   | 2 +-
>  3 files changed, 10 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
