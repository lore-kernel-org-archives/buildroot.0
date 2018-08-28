From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:08:14 +0200
Subject: [Buildroot] [PATCH next] git-crypt: disable for gcc affected by
 bug #64735
In-Reply-To: <3ba001ca8c4a2e548c47bdb7b52573b4ab2803a8.1535455062.git.baruch@tkos.co.il>
References: <3ba001ca8c4a2e548c47bdb7b52573b4ab2803a8.1535455062.git.baruch@tkos.co.il>
Message-ID: <20180828230814.6a0c212e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 14:17:42 +0300, Baruch Siach wrote:
> git-crypt needs exception_ptr. gcc older than 7 don't provide that on
> all architectures due to gcc bug #64735.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2a7/2a76ce39bc639b4f17ff33f8447d9094215e68d8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/git-crypt/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
