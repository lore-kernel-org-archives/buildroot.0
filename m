From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 22:53:45 +0100
Subject: [Buildroot] [PATCH 1/3] fs/ubifs: split long line,
 use simple asignment
In-Reply-To: <030e68fba51d84fb5adfc41aff5ec9e356ed2766.1514330428.git.yann.morin.1998@free.fr>
References: <cover.1514330428.git.yann.morin.1998@free.fr>
 <030e68fba51d84fb5adfc41aff5ec9e356ed2766.1514330428.git.yann.morin.1998@free.fr>
Message-ID: <20171227225345.7a90f83a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 00:20:45 +0100, Yann E. MORIN wrote:
> This line has been sitting there unchanged for years now, but it does
> not follow current best pratices, that is:
>   - do not use imediate assignment,
>   - split lines longer than ~80 chars.
> 
> Fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/ubifs/ubifs.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
