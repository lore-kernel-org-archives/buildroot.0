From: Todd Sampson <sampsonats@gmail.com>
Date: Thu, 28 May 2020 16:12:48 -0400
Subject: [Buildroot] make graph-size on Ubuntu 20.04, buildroot 2020.05-rc2
Message-ID: <CADJjDh9gqQzv_owicJduiXkRJqCsgjRP6DjwnLPZK6A4Gd-YOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/m9k2/buildroot$ make graph-size
You need python-matplotlib to generate the size graph
make[1]: *** [Makefile:904: graph-size] Error 1
make: *** [Makefile:84: _all] Error 2

python-matplotlib doesn't seem to be available on Ubuntu 20.04.  Maybe it's
because 20.04 is trying to pressure everyone to use python 3.

Is there a way to get it to work?

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200528/1332ce70/attachment.html>
