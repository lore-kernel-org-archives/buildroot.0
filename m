From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:22:59 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/chrony: fix systemd service
In-Reply-To: <1468523102-4191-1-git-send-email-christian@paral.in>
References: <1468523102-4191-1-git-send-email-christian@paral.in>
Message-ID: <20160715132259.53c403a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 12:05:02 -0700, Christian Stewart wrote:
> Fixes the systemd service, the binary is located at /usr/sbin not
> /usr/bin.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/chrony/chrony.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
