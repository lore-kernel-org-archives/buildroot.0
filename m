From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:23:28 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: test full set of
 hardening options
In-Reply-To: <20191027161324.15946-1-matthew.weber@rockwellcollins.com>
References: <20191027161324.15946-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027202328.11df6286@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 11:13:24 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This patch adds the remaining ssp and relro cases plus both of the
> fortify options. The randomization was left consistant between the
> options but the order of the conditions placed the most restrictive
> hardening options with more priority.
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> NOTE: These other two need to be applied first.
> http://patchwork.ozlabs.org/patch/1184843/
> http://patchwork.ozlabs.org/patch/1184842
> ---
>  utils/genrandconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
