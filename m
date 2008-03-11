From: Stephan Raue <stephan.raue@gmx.net>
Date: Tue, 11 Mar 2008 03:34:53 +0100
Subject: [Buildroot] MPlayer build fails
Message-ID: <47D5EFCD.9010807@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mplayer need -fomit-frame-pointer in CFLAGS to build.

               $(TARGET_CONFIGURE_ARGS) \
                CFLAGS="$(TARGET_CFLAGS) -fomit-frame-pointer" \
                LDFLAGS="$(TARGET_LDFLAGS)" \

Stephan
