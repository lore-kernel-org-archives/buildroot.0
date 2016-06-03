From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:47:05 +0200
Subject: [Buildroot] [PATCH] ficl: add missing -fPIC
In-Reply-To: <1464946351-5489-1-git-send-email-francois.perrad@gadz.org>
References: <1464946351-5489-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160603144705.5a138579@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jun 2016 11:32:31 +0200, Francois Perrad wrote:
> fix http://autobuild.buildroot.net/results/dec/dec926ad7d7880c385835ba7b380dd41fd7f3762/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/ficl/ficl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
