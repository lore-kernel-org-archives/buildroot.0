From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 13:19:31 +0200
Subject: [Buildroot] [PATCH] package/gst1-plugins-base: add upstream
 SA-2019-0001 security fix
In-Reply-To: <20190430060532.16221-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 Apr 2019 08:05:31 +0200")
References: <20190430060532.16221-1-peter@korsgaard.com>
Message-ID: <875zqvoi4c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2019-9928: GStreamer before 1.16.0 has a heap-based buffer overflow in
 > the RTSP connection parser via a crafted response from a server

 > For more details, see the advisory:
 > https://gstreamer.freedesktop.org/security/sa-2019-0001.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
