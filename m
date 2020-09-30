From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:55:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/frr: link with latomic if needed
In-Reply-To: <20200927125833.1892345-1-fontaine.fabrice@gmail.com>
References: <20200927125833.1892345-1-fontaine.fabrice@gmail.com>
Message-ID: <20200930225520.339c6def@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Sep 2020 14:58:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c98/c989f58eabd8f012798ade75e5b0f2a93b91c82d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/frr/frr.mk | 4 ++++
>  1 file changed, 4 insertions(+)

So I've applied, but it would be nicer to suggest to upstream to have a
the proper configure.ac logic to link against libatomic when needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
