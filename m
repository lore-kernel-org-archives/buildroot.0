From: Ray Zin <rayzinpwr@gmail.com>
Date: Mon, 13 Oct 2014 02:42:07 -0700
Subject: [Buildroot] perl 'custom module selection'
Message-ID: <CAKat-EZeif-fK5Zq9bB=00hGrVRu2bbOH9ax5xA7Lk7nRfh-Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've selected perl and configured the 'custom module selection' like this:

Cwd File/Basename File/Temp Getopt/Long Carp FindBin Scalar/Util

But I don't get Cwd or Scalar/Util (everything else, ok).

Under my build, normally these would be under i686-linux. So I also tried:

i686-linux/Cwd File/Basename File/Temp Getopt/Long Carp FindBin
i686-linux/Scalar/Util

Still no Cwd or Scalar/Util. Suggestions?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141013/96aedfd7/attachment.html>
