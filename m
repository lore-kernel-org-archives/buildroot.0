From: vbr vbr <vvvg77@gmail.com>
Date: Mon, 19 Dec 2011 17:47:42 -0800
Subject: [Buildroot] tutorial to extend buildroot?
Message-ID: <CAOrAeomixni4EZqKWV0p9bVfg9eOsQ+4LP4=CyK6POTsiga2iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have set up my buildroot environment, built an external toolchain
(crosstool ng) with uClibc, and I understand how to add autotools-based
packages to buildroot. I committed buildroot source to my svn repo and most
of the tarballs that I needed which sit in the dl directory. Everything
works great!

Now I have private programs and libraries that I would want to add in
buildroot infrastructure too, but I don't want to add them in the form of a
tarball like other open-source tools and libraries. I just want to commit
the source code for each library and integrate their respective makefiles
(or create a new makefile for each of them to work) with buildroot. (no
tarball involved).

Does buildroot infrastructure/makefiles support that? Any guidelines or
examples?
I haven't found info regarding that question in the online documentation so
far.

Thanks
Vincent
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111219/f6dd9f4f/attachment.html>
