From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:36:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: add host-cc-option
 macro
In-Reply-To: <20170703084107.5620-1-arnout@mind.be>
References: <20170703084107.5620-1-arnout@mind.be>
Message-ID: <20170722233607.0fc99028@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jul 2017 10:41:06 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This macro allows to test if HOSTCC supports a specific option. It is
> needed to pass '-no-pie' on recent Debian, Ubuntu and Gentoo hosts.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Makefile.in | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
