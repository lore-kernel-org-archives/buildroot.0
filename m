From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:43:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcr: gobject-introspection
 needs xsltproc
In-Reply-To: <20200424123715.624655-1-fontaine.fabrice@gmail.com>
References: <20200424123715.624655-1-fontaine.fabrice@gmail.com>
Message-ID: <20200428074343.34784e34@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 14:37:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build of gcr with gobject-introspection needs host-libxslt otherwise
> build will fail on:
> 
>   XSLTPROC Gcr-3.gir
> /bin/bash: xsltproc: command not found
> Makefile:6878: recipe for target 'Gcr-3.gir' failed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c08efff174d4773074e6cf3374228b48e057917b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gcr/gcr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
