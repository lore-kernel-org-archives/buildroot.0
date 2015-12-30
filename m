From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 19:24:45 +0100
Subject: [Buildroot] [PATCH] iptables: add parallel build fix patch
In-Reply-To: <1451498483-23715-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451498483-23715-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151230192445.3b14d6c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Dec 2015 15:01:23 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/5c4/5c4ca595c4bf744aa00fc58851eeccf81f9c6ecc/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-xtables-config-parser.h-to-BUILT_SOURCES.patch | 39 ++++++++++++++++++++++
>  package/iptables/iptables.mk                       |  2 ++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/iptables/0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
