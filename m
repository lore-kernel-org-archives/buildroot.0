From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 8 Sep 2019 21:03:44 +0300
Subject: [Buildroot] Why passing TARGET_DIR/BINARIES_DIR to
 post-build/post-install scripts?
Message-ID: <CALFsTFVUpMVBiBU2JUKnuWpz-Mm-iFyDGpvpXKGOJSzspf9rmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As many others, I have my post-build and post-images scripts when I
work with Buildroot.
I would like to know why do we pass TARGET_DIR as first parameter for
the post-build script (same for BINARIES_DIR in post-images)? They are
both available on both post-build and post-install environments and
can be easily referenced by $TARGET_DIR and $BINARIES_DIR.
Moreover, if I want to iterate through BR2_ROOTFS_POST_SCRIPT_ARGS in
my script, I always have to cut the first argument instead of just
using $@

I'll be more than happy to hear your thoughts regarding this issue.
Thanks,
Asaf.
