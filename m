From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 30 Oct 2013 22:44:05 +0200
Subject: [Buildroot] ubuntu 13.10 prerequisites
Message-ID: <CALdGskJ6kQnW2GrRxoojk5Og_sOwrm9bmCOVX2nk7bkFp-nadw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I installed ubuntu 13.10 after its release, a 64-bit version.  Before I
could get buildroot working, i had to install the 32-bit compatible libc,
gcc, g++ etc.
Apparently ubuntu 13.10 doesn't support ia32-libs any more.  Thus, you have
to manually install the required 32-bit packages as follows

sudo apt-get install libc:i386
sudo apt-get install cpp-4.8:i386
sudo apt-get install gcc-4.8:i386
sudo apt-get install binutils:i386
sudo apt-get install cpp:i386
sudo apt-get install gcc:i386
sudo apt-get install g++:i386

This list is by no means exhaustive, and is only intended to help anyone
out there scratching their heads due to this change in ubuntu 13.10.

Regards

Olivier Schonken
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131030/10f075fc/attachment.html>
