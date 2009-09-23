From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 23 Sep 2009 13:54:09 +0200
Subject: [Buildroot] use of HOST_GLIB
Message-ID: <1253706849.1618.60.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found that package/java/classpath and package/libsoup both use

 ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal

However HOST_GLIB does not seem to be defined. What is the proper way to
refer to the glib-genmarshal binary that is installed by the
host-libglib2 target?


Sven
