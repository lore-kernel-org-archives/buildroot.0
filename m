From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 23:18:31 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-ugly: fix x264 compile
 failure
In-Reply-To: <20180430194717.32013-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 30 Apr 2018 21:47:17 +0200")
References: <20180430194717.32013-1-ps.report@gmx.net>
Message-ID: <871seopjo8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch to fix compile with latest x264 library.
 > Fixes [1]:

 >   gstx264enc.c: In function 'plugin_init':
 >   gstx264enc.c:2900:36: error: 'x264_bit_depth' undeclared (first use in this function); did you mean 'x264_picture_t'?
 >      default_vtable.x264_bit_depth = &x264_bit_depth;
 >                                       ^~~~~~~~~~~~~~
 >                                       x264_picture_t

 > [1] http://autobuild.buildroot.net/results/a766a28c584534b6a30839cfd98428d840bce3f2

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
