From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:21:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] quagga: option for vtysh
In-Reply-To: <1426634143-31245-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1426634143-31245-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150320232130.10d2d027@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Tue, 17 Mar 2015 18:15:43 -0500, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> 
>   Changes v1 -> v2
>   - Added readline dependency (Suggested by Thomas P)

Applied, thanks. I've only done a minor change: add an explicit
--disable-vtysh option in an else clause.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
