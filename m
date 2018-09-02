From: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
Date: Sun, 2 Sep 2018 02:33:42 +0000
Subject: [Buildroot] Including example applications to target
Message-ID: <SYCPR01MB344072FCAF83E300F7033CC0CB0D0@SYCPR01MB3440.ausprd01.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I'm trying to add a new cmake package (aws-iot-devic-sck-cpp) to buildroot. I managed to integrate it and the shared object is added to the target /usr/lib folder. The build also produces a bunch of sample applications (and unit tests). These are not however added to the target (cmake install step doesn't include them in the first place). What is the best approach to add these sample applications to the final image. My two thinkings are:


- Add a post install package step to copy those samples (and certificates) to target

- Add a patch to the CMakeLists.txt file to add them in the install step.


Regards,

Bassem


Sent from Outlook<http://aka.ms/weboutlook>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180902/0cb19c75/attachment.html>
