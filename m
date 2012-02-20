From: Avishay Orpaz <avishorp@gmail.com>
Date: Mon, 20 Feb 2012 09:45:48 +0200
Subject: [Buildroot] Dynaminc Component System for Buildroot
Message-ID: <CAMkyJgCC0i5t6j+M2VefDRVx_qjaRTHfOUOgnrSc9U+aHA91XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I've been using buildroot for about two years for building embedded systems
on various platforms. An embedded system usually comprises of a set of
standard tool and custom software, scripts etc. Buildroot does great job on
the first, but then I have to manually compile the project-specific
software and install it in the target system created by buildroot. In order
to make workflow smoother, I have an idea of adding a dynamic component
support for buildroot. In such a system, buildroot, when invoked, will scan
a specific directory for components. Components are directories with some
distinguishing feature (a special file or so) which contains buildroot .mk
file. Those components will appear on buildroot configuration menu, will
use the regular compilation-installation infrastructure it provides and
will be installed in the target filesystem as any other, out-of-the-box
component.

I'm willing to put time and effort into building such an extension, but I
would really like to get some feedback before I start, and to estimate the
chances it would be merged into the buildroot mainline.

Avishay
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120220/5f723e1d/attachment.html>
