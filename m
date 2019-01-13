From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:29:18 +0100
Subject: [Buildroot] [PATCH 1/2] lxc: add optional dependency to
 bash-completion
In-Reply-To: <20190112210844.4021-1-fontaine.fabrice@gmail.com>
References: <20190112210844.4021-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113142918.30efd3f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 22:08:43 +0100, Fabrice Fontaine wrote:
> lxc uses the completionsdir variable from bash-completions.pc to decide
> where to install things.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lxc/lxc.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
