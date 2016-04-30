From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:55:12 +0200
Subject: [Buildroot] [PATCH] libtommath: add -fPIC
In-Reply-To: <1462005187-32394-1-git-send-email-francois.perrad@gadz.org>
References: <1462005187-32394-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160430145512.34b475dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 10:33:07 +0200, Francois Perrad wrote:
> fix build with x86_64, see http://autobuild.buildroot.net/results/212/212469db5dc8399070390603c0fdf7f12b130cda/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libtommath/libtommath.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
