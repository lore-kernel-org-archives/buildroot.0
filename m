From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 21:57:35 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
 enabled
In-Reply-To: <20161019172550.GV21808@waldemar-brodkorb.de>
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
 <20161018172543.20a693fa@free-electrons.com>
 <CAJtjsKbAHTY4LwuS=oGpxhCf=hCupmk0Si7-kCTnA3YYtFbgfA@mail.gmail.com>
 <20161019145904.6a82c434@free-electrons.com>
 <CAJtjsKbabwixT3bieo4uXFFyUhA=JXgFsoV5Td=yB+JfckRY1w@mail.gmail.com>
 <ea383c3d-9ace-bafe-5c32-0bc8fad656c3@mind.be>
 <20161019172550.GV21808@waldemar-brodkorb.de>
Message-ID: <20161019215735.52749cd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 19:25:50 +0200, Waldemar Brodkorb wrote:

> Just want to mention that I want integrate gettext-tiny into
> uClibc-ng soon. It is a stub implementation. The existing stub isn't
> selectable since a while...
> 
> https://github.com/rofl0r/gettext-tiny

Interesting. I once started experimenting a bit with integrating
gettext-tiny in Buildroot, but it was not that easy to achieve.

In fact, the problem with gettext is two-fold: it's both the target
gettext (i.e libintl) but also the host gettext (for gettext tools)
that are annoyingly long to build.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
