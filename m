From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:41:41 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/xvisor: needs host-dtc
In-Reply-To: <20200712213205.64850-1-fontaine.fabrice@gmail.com>
References: <20200712213205.64850-1-fontaine.fabrice@gmail.com>
Message-ID: <20200712234141.45d5642e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 23:32:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-dtc is a mandatory dependency since version 0.3.0 and
> https://github.com/xvisor/xvisor/commit/e31344c9b5835c8a12bfffb3a359f343b273fab5
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3f49302e7d05d666a51db0cb51365620a63e3b40
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add link on autobuilder failure

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
