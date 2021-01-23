From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 22:02:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/brltty: add polkit optional
 dependency
In-Reply-To: <20210105171947.4236-1-fontaine.fabrice@gmail.com>
References: <20210105171947.4236-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123220204.64ed992e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Jan 2021 18:19:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> polkit is an optional dependency (enabled by default) since version 5.4:
> https://github.com/brltty/brltty/commit/e62b3c925d03239a372d425fb87b2cac65d8ef19
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/brltty/brltty.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
