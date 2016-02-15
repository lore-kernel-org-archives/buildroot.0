From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Feb 2016 22:43:55 +0100
Subject: [Buildroot] [PATCH] graphite2: security bump to version 1.3.5
In-Reply-To: <1455554749-11434-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455554749-11434-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160215224355.5896546e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Feb 2016 13:45:49 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-1521 - An exploitable out-of-bounds read vulnerability exists
> in the opcode handling functionality of Libgraphite. A specially crafted
> font can cause an out-of-bounds read resulting in arbitrary code
> execution. An attacker can provide a malicious font to trigger this
> vulnerability.
> CVE-2016-1522 - An exploitable NULL pointer dereference exists in the
> bidirectional font handling functionality of Libgraphite. A specially
> crafted font can cause a NULL pointer dereference resulting in a crash.
> An attacker can provide a malicious font to trigger this vulnerability.
> CVE-2016-1523 - An exploitable heap-based buffer overflow exists in the
> context item handling functionality of Libgraphite. A specially crafted
> font can cause a buffer overflow resulting in potential code execution.
> An attacker can provide a malicious font to trigger this vulnerability.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/graphite2/0001-disable-double-promotion.patch | 13 +++++++------
>  package/graphite2/graphite2.hash                      |  4 ++--
>  package/graphite2/graphite2.mk                        |  2 +-
>  3 files changed, 10 insertions(+), 9 deletions(-)

Applied, thanks.

Note that our graphite2/Config.in points to
http://sourceforge.net/projects/silgraphite/, which states:

"""
This project has been deprecated. Graphite2, a new version of the
Graphite engine, is available at: https://github.com/silnrsi/graphite
with its own bug tracker.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
