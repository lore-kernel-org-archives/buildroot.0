From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 09:09:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.2
In-Reply-To: <CAPi7W83AsH8BEvr7yiUZAt=JdLnDQg+wL2K_bpbR-FuSM1RiVw@mail.gmail.com>
References: <20200421114849.855332-1-julien.grossholtz@openest.io>
 <20200428073812.29aa32ee@windsurf.home>
 <CAPi7W83AsH8BEvr7yiUZAt=JdLnDQg+wL2K_bpbR-FuSM1RiVw@mail.gmail.com>
Message-ID: <20200428090923.3841df3f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 08:31:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find -lanl
> >
> > which I believe is only provided by glibc. Not sure what the fix is.
> > Making paho-mqtt-c depend on glibc would not be really nice.  
> I fixed it upstream with:
> https://github.com/eclipse/paho.mqtt.c/commit/517e8659ab566b15cc409490a432e8935b164de8.
> I'll send a patch.

Excellent, thanks!

> It should be noted that that upstream has the "interesting" idea of
> deleting and recreating git release. For example, 1.3.2 has been
> "re-released" 20 hours ago. It could explain why the hash was wrong
> when this package was bumped.

Gah, very bad. Since you're in touch with upstream, perhaps you could
tell them that this is really bad, and why it is really bad?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
