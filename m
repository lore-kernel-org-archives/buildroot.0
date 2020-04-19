From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:28:12 +0200
Subject: [Buildroot] [PATCH 06/12] package/gcr: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-6-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
 <20200401002134.1779241-6-aduskett@gmail.com>
Message-ID: <20200419162812.38b77a38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Mar 2020 17:21:28 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, add the gobject-introspection package to
> the dependency list and set the conf opt --with-introspection.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gcr/gcr.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

This fails to build:

  XSLTPROC Gcr-3.gir
/bin/bash: xsltproc: command not found
Makefile:6878: recipe for target 'Gcr-3.gir' failed

See:

  http://autobuild.buildroot.net/results/178/178ea11b71c87e167fc3f3787fb31ce4ebacb4ff/build-end.log

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
