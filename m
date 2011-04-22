From: Ryan Whelan <rcwhelan@gmail.com>
Date: Thu, 21 Apr 2011 22:17:56 -0400
Subject: [Buildroot] Python segmentation fault
Message-ID: <BANLkTikxb2A7_Q13NczB11RPiPpEvdduag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Im having an issue with the python interactive prompt in the latest
git revision when i try to run it, it tries to start and seg faults.
If I create a file, and run it, it seems to work- its only the
interactive prompt.

/ # python
Python 2.7.1 (r271:86832, Apr 21 2011, 21:52:43)
[GCC 4.3.5] on linux2
Type "help", "copyright", "credits" or "license" for more information.
Segmentation fault
/ #

I've tried with 32bit and 64bit builds, with different versions of GCC
and uClibc with the stack smash protection on and off.  I'm not sure
what info is going to be useful but here
(http://pastebin.com/usP2962n) is a strace and here
(http://pastebin.com/ApfWnTgq) is my .config.  I've enabled most of
the python related options as this is a platform for python app
hosting.  Sorry to include so little info, like i said, im not sure
what is needed- let me know if you need something else and i will
provide whatever i can.

thanks!
