From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 10:46:15 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: add an option to control
 USE_GSTREAMER_GL
In-Reply-To: <20181025002738.27486-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 25 Oct 2018 03:27:38 +0300")
References: <20181025002738.27486-1-aperez@igalia.com>
Message-ID: <87efbouh3s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This covers the case where GL/GLES is available (so -DENABLE_OPENGL=ON
 > gets passed), which makes the webkitgtk build system assume GStreamer-GL
 > is available, while actually it is not.

 > Also, providing an option to manually disable usage of GStremer-GL can
 > help with certain target configurations in which using OpenGL for video
 > handling might result in incorrect rendering.

 > This fixes some autobuilder failures like the following:

 >   http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674
 >   http://autobuild.buildroot.net/results/00c1a8ea23a99728a4f3f4478705f2383414ae41

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
