From: Eric Seifert <eric.seifert@cyaninc.com>
Date: Tue, 28 Aug 2012 08:43:38 -0700
Subject: [Buildroot] 2012.08-rc3 skipping python modules during build
Message-ID: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I have been using the stable 2012.05 build without issue and wanted
to try the latest rc3. I have a few extra python modules I have added to
the external python modules section. It seems in the latest rc3 is not
building them or even downloading the packages even though they are
selected in the menuconfig, they are just ignored. It works in the stable
2012.05 build. When I select one of the existing external modules such as
pthon-serial, it does get built.


Thanks,
Eric Seifert
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120828/edc77f03/attachment.html>
