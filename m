From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon, 18 Sep 2006 21:49:28 +0200
Subject: [Buildroot] Building rrdtool
Message-ID: <20060918214928.2c3fa275.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'currently trying to build rrdtool to be used by ntop for an i386 target.

I have automake/autoconf problems to tell rddtool to use the
$(STAGING_DIR)/include directory for the headers of freetype2 and
libart_lgpl. This because of the ac_cv_prog_PKGCONFIG macro.

Did someone already tried or succeeded in cross-compiling rrdtool ?

For the automake/autoconf guru, what is the right way to tell rrdtool
not to use the PKGCONFIG tool and search only in $(STAGING_DIR) for
its headers ?

Thanks in advance for any tips.

Cheers,
Philippe
