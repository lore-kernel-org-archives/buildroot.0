From: Robert Smigielski <ptdropper@gmail.com>
Date: Fri, 30 Jun 2017 08:55:46 -0400
Subject: [Buildroot] question on setting file ownership after boot
Message-ID: <CABWt4evLAk_=Nr3ktrPj-NEArjBaicmNkMxAoDk7HNmHe9LSug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone

I am making customization on my Buildroot created board support package. I
know there is some method that configures specific ownership of files in
the various file system directories on boot up. On this embedded board I
want root to own all the dbus files so I want to specifically set file and
directory ownership and group membership to root system wide. I cannot
recall what file configures that. I know that the file
system/device_table.txt performs a similar function for /dev/* files but
what does so for files over in /etc and /usr and so on?

-- 
Robert Smigielski
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170630/8fdb2519/attachment.html>
