From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Mar 2019 15:10:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/haproxy: disable on nios2 and
 microblaze
In-Reply-To: <20190330133107.19895-1-fontaine.fabrice@gmail.com>
References: <20190330133107.19895-1-fontaine.fabrice@gmail.com>
Message-ID: <20190330151000.7d123798@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 14:31:07 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/4d7be00514f5276a9fd533adfdbc3d5183bb59ca
>  - http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/haproxy/Config.in | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Applied to master, thanks. I'm not a big fan of those architecture
dependencies, because it means we will never notice if those issues get
fixed in the future or not. That being said, who is ever going to us
haproxy on a low-speed Microblaze on NIOS2 system ?

So it's good enough.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
