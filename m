From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:34:09 +0100
Subject: [Buildroot] [PATCH] dhcp: fix bad --enable/disable-debug logic
In-Reply-To: <1415711336-27589-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415711336-27589-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141111153409.01ba3630@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 11 Nov 2014 10:08:56 -0300, Gustavo Zacarias wrote:
> It interprets disable as enable and wreaks havoc since it changes the
> behaviour of the build, for instance not using configured leases files
> paths.
> Thanks to Nathaniel Roach for pointing me to this problem.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dhcp/0001-fix-configure-debug.patch | 23 +++++++++++++++++++++++
>  package/dhcp/dhcp.mk                        |  2 ++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/dhcp/0001-fix-configure-debug.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
