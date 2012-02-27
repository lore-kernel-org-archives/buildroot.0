From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Feb 2012 10:34:08 +0100
Subject: [Buildroot] [PATCH 1/2] vlc: new package
In-Reply-To: <4F4B49E3.8000606@lucaceresoli.net> (Luca Ceresoli's message of
 "Mon, 27 Feb 2012 10:16:19 +0100")
References: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
 <4F4B49E3.8000606@lucaceresoli.net>
Message-ID: <87r4xghb73.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Hi Ismael,

 >> diff --git a/package/multimedia/vlc/vlc-uclibc-fixes.patch b/package/multimedia/vlc/vlc-uclibc-fixes.patch
 >> new file mode 100644
 >> index 0000000..3ce60b3
 >> --- /dev/null
 >> +++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
 >> @@ -0,0 +1,20 @@
 >> +diff -u a/src/posix/linux_specific.c b/src/posix/linux_specific.c
 >> +--- a/src/posix/linux_specific.c	2012-02-08 16:43:30.000000000 -0200
 >> ++++ b/src/posix/linux_specific.c	2012-02-09 03:51:20.925504594 -0200

 Luca> It's better to add a few lines at the beginning of patches to clarify
 Luca> why it's needed and
 Luca> the source (e.g. the URL of a website or mailng list where it came from).

And if you are the author, please add your signed-off-by line here as
well.

-- 
Bye, Peter Korsgaard
