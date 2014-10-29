From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:34:13 +0100
Subject: [Buildroot] [PATCH 1/1] iptables: fix userspace compilation of
 ip tables with C++
In-Reply-To: <1413227563-5383-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413227563-5383-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20141029223413.70abc05b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 13 Oct 2014 14:12:43 -0500, Matt Weber wrote:
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...ix-userspace-compilation-of-ip_tables_c_h.patch |   43 ++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/iptables/iptables-03-fix-userspace-compilation-of-ip_tables_c_h.patch

This patch apparently dates back from 2012. Why has it never been
merged upstream? Also, I don't really understand the interaction
between the kernel headers, and this include/linux/ header in iptables.

Has the problem been reported upstream to iptables?

Gustavo, an opinion?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
