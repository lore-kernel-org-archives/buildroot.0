From: Bryce Schober <bryce.schober@gmail.com>
Date: Wed, 25 Sep 2013 17:47:09 -0700
Subject: [Buildroot] Using source inclusions in defconfig
Message-ID: <CAJpxd04ok1Eu_kERG1UQy=y4ixUWcz-YZJujx=SnJysJThtOaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks to me like the "source" command doesn't work in defconfigs. I get
"warning:: unexpected data", and it doesn't include the referenced config.

Is this a generic limitation, or an artifact of my ancient buildroot?

It sure would be nice to modularize defconfigs for my target variants...

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130925/a4fda23b/attachment.html>
