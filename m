From: ravi chandran <ravigct27@gmail.com>
Date: Tue, 13 Feb 2018 00:10:16 +0530
Subject: [Buildroot] Reg: Add a downloaded tar file directly to rootfs
Message-ID: <CAAMHf5HizKFeDaj2v=fv0CCNh+pJhmh=Vrs+Gy0LRnKODDSk=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
     I am having a set of directories and files(actually contain some
add-on packages), which needs to be populated inside /srv directory  of
target system. I need a way to download the archived file and put it under
one of the directory of the rootfs. And during the target system
initialization, using init script i will extract the files and populate it
under the /srv directory.

     could some please provide some hint, what is the right way to do this
in buildroot?

Thanks..
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180213/3bd73634/attachment.html>
