From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 21:57:00 +0200
Subject: [Buildroot] [PATCH] package/libssh: security bump to version
 0.9.4
In-Reply-To: <9aa0bdcf9bae257961438cd369b273fade725f95.1586789244.git.baruch@tkos.co.il>
References: <9aa0bdcf9bae257961438cd369b273fade725f95.1586789244.git.baruch@tkos.co.il>
Message-ID: <20200413215700.4a6ab421@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 17:47:24 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Fixes CVE-2020-1730: Possible DoS in client and server when handling
> AES-CTR keys with OpenSSL.
> 
> Format hash file with two spaces delimiter.
> 
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libssh/libssh.hash | 4 ++--
>  package/libssh/libssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
