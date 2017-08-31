From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Aug 2017 21:33:37 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
In-Reply-To: <7d358a39-0c49-204c-f784-d0e7efc646bd@gmail.com>
References: <20170830224010.15658-1-romain.naour@gmail.com>
 <20170831091419.3d0039cc@windsurf.lan>
 <CANLo3Jix+ojJWq6QTRaxxpOMDHBJtkUkiZnAzy6neY95h=OGCA@mail.gmail.com>
 <20170831093921.11448124@windsurf.lan>
 <CANLo3Jj1_a7+n1on26o94mzxRVKhZFGH4+g981GxyqmUng-2Gg@mail.gmail.com>
 <20170831131049.5541217e@windsurf.lan>
 <7d358a39-0c49-204c-f784-d0e7efc646bd@gmail.com>
Message-ID: <20170831213337.707c6ca9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Aug 2017 20:42:10 +0200, Romain Naour wrote:

> checking for xml2-config... /bin/xml2-config
> configure: using libxml-2.9.4
> checking for xslt-config...
> /home/naourr/buildroot-test/test/arete-glibc2.26/host/bin/xslt-config
> configure: using libxslt-1.1.29

Is HOST_DIR/bin in the PATH when calling configure? Why does it
use /bin/xml2-config and not the one in HOST_DIR/bin ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
