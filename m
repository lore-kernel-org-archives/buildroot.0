From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:24:07 +0100
Subject: [Buildroot] [PATCH] thttpd: add systemd service file
In-Reply-To: <1426795074-9129-1-git-send-email-mike@mikebwilliams.com>
References: <1426795074-9129-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320142407.29be59ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Thu, 19 Mar 2015 15:57:54 -0400, Mike Williams wrote:
> Based on Arch service file, adjust to point to /usr/sbin.
> 
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/thttpd/thttpd.mk      |  5 +++++
>  package/thttpd/thttpd.service | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/thttpd/thttpd.service

Since this assumes we install systemd unit files in /usr/lib, could you
take this patch as part of your "RFC: systemd and service files
cleanup" series?

See my question about this series related to symbolic links (absolute
vs. relative), and adapt this patch as well accordingly.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
