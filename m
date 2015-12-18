From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 10:08:50 +0100
Subject: [Buildroot] [PATCH 1/5] pkg-download: do not test SITE_METHOD
In-Reply-To: <1447929366-8972-2-git-send-email-jezz@sysmic.org>
References: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
 <1447929366-8972-2-git-send-email-jezz@sysmic.org>
Message-ID: <20151218100850.3eb39ac9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 19 Nov 2015 11:36:02 +0100, J?r?me Pouiller wrote:
> SITE_METHOD is always set in inner-generic-package. So, it is useless
> to test it in pkg-download.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/pkg-download.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
