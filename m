From: Daniele Colombo <daniele.email0@gmail.com>
Date: Tue, 5 Jan 2016 11:16:48 +0100
Subject: [Buildroot] Include in Autotools Buildroot ARM toolchain for
	eclipse Luna Indexer
Message-ID: <CAC3k=W3S56fWDFALf3LxKaskgO7zETRHoBHVxqPYkvQ0t3WFrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to create a Shared Library for ARM with buildroot Autotool
toolchain, the toolchain have the entry "CDT GCC Build-in Compiler
Settings" that provide C++ standard include from the host (/usr/include
...).

In the eclipse project this include is addressed instead the c++ include
provided by buildroot.

If I disable "CDT GCC Build-in Compiler Settings" eclipse is not able to
resolve standard C++ include.

No problem with building, the problem affect only eclipse Index and maybe
Cross debug,

Any suggestion ?

Thanks
Daniele
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160105/fd3a628c/attachment.html>
