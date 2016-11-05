From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 11:51:44 +0100
Subject: [Buildroot] [PATCH] get-developers: fix parentheses for print
In-Reply-To: <20161105041000.22455-1-gael.portay@savoirfairelinux.com>
References: <20161105041000.22455-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161105115144.43a467f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 00:10:00 -0400, Ga?l PORTAY wrote:
> Python3 complains about missing parentheses.
> 
> $ ./support/scripts/get-developers
>   File "./support/scripts/get-developers", line 45
>     print f
>           ^
> SyntaxError: Missing parentheses in call to 'print'
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  support/scripts/get-developers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
