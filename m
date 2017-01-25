From: Ted Victorio <tvan5bee@yahoo.com>
Date: Wed, 25 Jan 2017 20:31:44 +0000 (UTC)
Subject: [Buildroot] Eclipse/Buildroot toolchain: make: *** [hello.o] Error 1
References: <1098752994.802685.1485376304266.ref@mail.yahoo.com>
Message-ID: <1098752994.802685.1485376304266@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've installed the following:- sudo apt-get install build-essential autotools-dev autoconf automake make
- buildroot-2016.11.tar.gz was installed with External toolchain toolchain (LINARO_ARM)
    In  Toolchain -> Copy gdb server to the Target.
                  -> Register toolchain within Eclipse Buildroot plug-in
        Build options -> "build packages with debugging symbols"

- eclipse-cpp-luna-SR2-linux-gtk.tar.gz
- openjdk-7-jre
- Eclipse Luna - buildroot : http://buildroot.org/downloads/eclipse/luna 

I followed steps to activate and install the Buildroot Eclipse plugin
(https://github.com/mbats/eclipse-buildroot-bundle/wiki/Tutorial-:-How-to-activate-and-install-the-Buildroot-Eclipse-plugin-%3F)

I created a new C project using the Buildroot toolchain 
(https://github.com/mbats/eclipse-buildroot-bundle/wiki/Tutorial-:-How-to-create-a-new-C-project-using-the-Buildroot-toolchain-%3F)


    When I created new C test project, I do see the Buildroot ARM toolchains:
    The PATH is pointing to the correct location
        PATH: /home/test/Downloads/buildroot-2016.11/output/host/usr/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

When Build the project, this error occurs:
    make: *** [hello.o] Error 1        test   C/C++ Problem

Please advise. Thank you very much.
Ted    


--------------------------------------------------------------------------------
test project:
hello.c:

#include <stdio.h>

int main()
{
    printf("\n..hello..\n");
    return 0;
}
