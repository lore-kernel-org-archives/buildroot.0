From: Daniel Franzini <daniel.franzini@gmail.com>
Date: Sat, 16 Apr 2016 18:11:54 -0300
Subject: [Buildroot] host=win32
Message-ID: <CAFjNrKLdChKO10W3LLYWKxhW85CyNRXRN7M=qigxf6h=mDAPbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all.

I'm new to buildroot but a reasonably seasoned software developer. Now I'm
having some issues with old toolchains (uclibc-targetted) for custom boards
developed by a partner of mine.

Using buildroot, in a almost out-of-the-box setup (arm-linux-uclibc) I can
actually create a shiny new toolchain for these board and that is pretty
much fine.

The thing is that most of our developers use Windows based workstations. So
I have done some research on tools that could be used to generate a Windows
hostable toolchain and here I am. From what I could understand from the
manuals, it is possible to use a external toolchain to build the desired
toolchain in buildroot. So here are the questions:

1.) Can this external toolchain be mingw-baed? There are pre-packaged mingw
tool for several mainstream linux distros (Debian, Ubuntu) and I tought
they could be with buildroot. There are also some software that is
cross-compiled from Linux to Win32 (FileZila).

2.) Is there any serious limitation with the mingw tools that prevent them
from building gcc inside Linux? I mean, if they can build some software,
they can build gcc also. What is, if any, the problem with mingw tools?

3.) I'm willing to give this a try but I still have to figure out things in
buildroot. Does anyone has a good starting point?


Thanks in advance.

-- 
Daniel

"Let us change our traditional attitude to the construction of programs.
Instead of imagining that our main task is to instruct a computer what to
do, let us concentrate rather on explaining to human beings what we want a
computer to do." (Donald Knuth)

"Yes, technogeeks can be funny, even if only to each other." (
http://www.boogieonline.com/revolution/science/humor/)"

"Man is driven to create; I know I really love to create things. And while
I'm not good at painting, drawing, or music, I can write software."
(Yukihiro Matsumoto, a.k.a. ``Matz'')
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160416/6c1afb48/attachment.html>
