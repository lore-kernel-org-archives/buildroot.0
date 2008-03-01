From: Florian Huber <florian.huber@lindoze.net>
Date: Sat, 01 Mar 2008 17:32:20 +0100
Subject: [Buildroot] $(ARCH) not set
Message-ID: <47C98514.6070407@lindoze.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm trying to build a system for a soekris with a geode cpu (actually
did it before once...). Somehow the $(ARCH) variable used in several
makefiles is not set properly. E.g. there are directories called
"project_build_" and "toolchain_build_". And in the build scripts the
target architecture seems to be "-uclibc-linux" instead of
"i386-pc-uclibc-linux".

Has anyone else seen this error or knows where $(ARCH) should be set and
where I could look what went wrong?

Thanks in advance

Florian

P.S.: I don't think it is a buildroot bug - maybe related to my
stupidity. Therefore I didn't add it to bugzilla.
