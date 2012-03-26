From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 25 Mar 2012 20:27:13 -0400
Subject: [Buildroot] [PATCH] New package: zxing
In-Reply-To: <201203252300.45593.arnout@mind.be>
References: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
 <201203252055.04278.arnout@mind.be>
 <CA+-urNQG9au7Y7MThu0ibXHiCkCU2Uio+vnBC3K9LXCjXtjNTw@mail.gmail.com>
 <201203252300.45593.arnout@mind.be>
Message-ID: <CA+-urNRehQs7SD3wRs4Z=OhJeb7u7Lo+RKWHV=sxzEZGHvwBUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 25, 2012 at 5:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> [snip]
>
> ?I think the packaged version is only there because scons is usually not
> installed on your system and they don't want to have external dependencies.
> Only one way to find out: try it! :-)

Hint taken. :)

The host-scons version works just as well as the packaged scons. I
just sent a v2 patch with the host-scons change. Certainly, the
zxing.mk file looks better now that it doesn't have direct the python
dependency. Speaking of which, I noticed that scons.mk does not depend
on host-python and just uses the local system's version of python. Is
that ok?

Frank
