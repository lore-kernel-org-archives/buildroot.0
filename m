From: Allan Nielsen <a@awn.dk>
Date: Tue, 25 Oct 2011 15:15:42 +0200
Subject: [Buildroot] Custom automake arguments
Message-ID: <CANdC7UEcaK0AkPfL_Rr_f=DwXbT9=ikhn3H9a+NyLA1CEtubfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Is it possible to parse custom package specifick arguments to automake
(run'ed through autorecong)

I have tried this, but it does not seem to work:
foo-configure: override AUTOMAKE:=$(HOST_DIR)/usr/bin/automake
$(FOO_AUTOMAKE_FLAGS)

Best Regards
Allan W. Nielsen
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111025/aecd022b/attachment.html>
