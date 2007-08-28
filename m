From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Tue, 28 Aug 2007 15:07:43 -0600
Subject: [Buildroot] Can't resolve symbol '__cxa_atexit'
Message-ID: <46D48E9F.4000101@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
   I am trying to re-create an environment that I created in Oct 2005, 
so that I can make some changes to a program I wrote way back then. I 
was using uClibc 0.9.28 at the time. I've used a current buildroot to 
get me what I thought was that environment. I think I have the same 
gcc/binutils versions 3.4.6 and binutils 2.16.1. When I compile my 
program against this new environment it seems to work, until I move it 
to the target device, where it runs for a bit then outputs

./a.out: Can't resolve symbol '__cxa_atexit'

So I'm assuming that something changed in the uClibc config I originally 
used and this one that I tried to get to match. Any ideas how to go 
about re-creating this environment or how to solve the above error?

-- 
Nathanael D. Noblet
