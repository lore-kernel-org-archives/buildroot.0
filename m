From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:29:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cdrkit: download from
 alternate site
In-Reply-To: <1413725408-25972-1-git-send-email-kaszak@gmail.com>
References: <1413725408-25972-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141019162912.11495e0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sun, 19 Oct 2014 15:30:08 +0200, Karoly Kasza wrote:
> www.cdrkit.org looks dead, the cdrkit archive always downloads from the
> buildroot.org mirror. This patch points the downloader to the Debian
> archive site.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/cdrkit/cdrkit.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
