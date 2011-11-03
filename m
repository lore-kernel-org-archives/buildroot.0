From: Allan W. Nielsen <a@awn.dk>
Date: Thu,  3 Nov 2011 18:09:29 +0100
Subject: [Buildroot] gst-plugins-bad problems
Message-ID: <1320340171-19905-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I have had some problems getting gst-plugins-bad to work. After some
debugging I found that is is because some of the optional features
which are not part of the configure system is enabled by the configure
script.

To make it easier to spot this kind of problems, I have inlined the
configure help text.

Let me know what you think this...


Best regards
Allan W. Nielsen
