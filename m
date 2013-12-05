From: Atilla Filiz <atilla.filiz@gmail.com>
Date: Thu, 5 Dec 2013 15:23:46 +0100
Subject: [Buildroot] Is there any effort for Quilt integration?
Message-ID: <CACTZKX4jtApXWz+EJB=yDubbS9ESSpS9p0WXw9wGV7KL-n+ZJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have just started working with quilt and loved how it can be used for
patch management and a mini version control scheme.

Is there anyone working on Quilt support for Buildroot?

Whit Quilt
1- The patching step will use 'quilt import' instead of 'patch' if quilt
exists
2- In the output/build/package-ver directory, there will be a patches subdir
 2.1 This way the user will be able to un-apply, re-apply and modify
existing patches
 2.2 The user will be able to create patches in-place, without needing to
copy, clean and diff manually



-- 
Atilla Filiz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/1ce5cf71/attachment.html>
