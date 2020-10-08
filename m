From: mattwood2000 at gmail.com <mattwood2000@gmail.com>
Date: Thu, 8 Oct 2020 16:51:27 -0400
Subject: [Buildroot] Separate Host and Target patches
Message-ID: <CADjezmY7Zy6kUVa-dULzzLTdph_tQC26VXNKMDpWdO9jYAUWPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

is it possible to separate host and target patches?  For example, lets say
I have a package foo that has a dependency of host-foo.  But, I need to
apply different patches against the package Makefile for the host and
target builds.

I didn't really see this usecase in the docs or in other package examples.

Thanks, Matt.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201008/27fd76a4/attachment.html>
