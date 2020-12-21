From: Patricia Holden <pholden@nklabs.com>
Date: Sun, 20 Dec 2020 19:01:53 -0500
Subject: [Buildroot] Configuring OpenGL
Message-ID: <CAJ6EmCejgFnDSza2xbcWgJrjrY1Wc7pz1AZLCna4TneuZd0gyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know this topic has been visited a couple times, but I did not see my
particular problem in the threads.  I am trying to add a package that
requires QT5 components and Gstreamer.  In order to add QT5, openGL is
required.

Buildroot version I am using is  buildroot-2020-02.

I went into the menuconfig->Libraries->Graphics after looking at
package/Config.in to find out where I would enable it.  When I got into the
Graphics libraries, openGL was not an option anywhere in the list.

My question is:  What do I need to do to enable opengl in the menuconfig so
that I can get my package built and into target?

Thanks!
Patricia

-- 
Patricia A. Holden
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201220/d04e501f/attachment.html>
