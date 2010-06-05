From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  5 Jun 2010 20:03:46 +0200
Subject: [Buildroot] [pull-request] A few fixes on gstreamer
Message-ID: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This branch brings a couple of fixes about gstreamer. I realized
recently that GstParse needed flex/bison tools. And yesterday someone
reported (on IRC...) a problem about the impossibility to construct a
very simple gst pipeline (gst-launch fakesrc ! fakesink).

available at:
           git://git.potipota.net/buildroot gstreamer-fixes

Regards,

--
Lionel Landwerlin
