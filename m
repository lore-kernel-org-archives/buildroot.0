From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:51:46 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/mosh: remove unnecessary
 patch
In-Reply-To: <1438033548-10582-1-git-send-email-christian@paral.in>
References: <1438033548-10582-1-git-send-email-christian@paral.in>
Message-ID: <20150727235146.35234bbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christian Stewart,

On Mon, 27 Jul 2015 14:45:48 -0700, Christian Stewart wrote:
> According to upstream (keithw/mosh issue #650), it's okay to have the
> "locale" system command fail with "command not found" because this is a
> non-critical action that occurs just before Mosh exits with an error
> anyway. Thus, this patch is unnecssary, and can be removed.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/mosh/0001-remove-system-locale-calls.patch | 46 ----------------------
>  1 file changed, 46 deletions(-)
>  delete mode 100644 package/mosh/0001-remove-system-locale-calls.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
