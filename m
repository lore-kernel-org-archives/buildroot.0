From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:26:37 +0100
Subject: [Buildroot] A 64 bit system which enables 32 bit applications
In-Reply-To: <CAPFcPT+TVFb3FD4ubuYH=m5SNOOiObS4p1WENMf+kE8XgvXnWA@mail.gmail.com>
 (Mau Z.'s message of "Sun, 13 Mar 2016 20:12:35 +0200")
References: <CAPFcPT+TVFb3FD4ubuYH=m5SNOOiObS4p1WENMf+kE8XgvXnWA@mail.gmail.com>
Message-ID: <8760wqgm4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mau" == Mau Z <zmau1962@gmail.com> writes:

 > Hi all,
 > I need to build a 64 bit system, but I need to run a 32 bit
 > application on to of it.
 > I looked into the buildroot menus/options, and I could not find any
 > clear way to do this.
 > Any advice ?

What do you want to do exactly? To run a 64bit kernel but use 32bit
userspace or rather a multilib setup with mixed 32bit/64bit
libraries/binaries?

The first should be doable by tweaking your kernel config, but multilib
is not supported by Buildroot.

-- 
Bye, Peter Korsgaard
