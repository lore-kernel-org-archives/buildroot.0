From: Ram kumar <ramkumar.research@gmail.com>
Date: Fri, 6 Jun 2008 16:55:26 -0700
Subject: [Buildroot] Target's /sys directory not created by buildroot
Message-ID: <6306c640806061655t6be09c97ud175dfdcf0fa82e6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
         When i see the target skeleton of the root file system in the
directory /buildroot/generic/target_skeleton there is a /sys directory.But
it is not created under the target root filesystem ie)
under
/project_build_<arch>/root/....When i give make.

There is no /sys directory inside the Target's root filesystem though it is
present in the target_skeleton directory......

Do i have to enable any option in the menuconfig to get that directory under
the target filesystem......????

Please suggest me.....

Regards,
Ram
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080606/ab2b2ac5/attachment.htm 
