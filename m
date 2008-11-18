From: Pierre KILLY <pierre.killy@pixvisio.com>
Date: Tue, 18 Nov 2008 13:14:21 +0100
Subject: [Buildroot] Cannot copy kernel zImage
Message-ID: <4922B19D.7030002@pixvisio.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody !

My name is Pierre and I'm working on a new board that we developed in my 
company, based on the pxa-270.

I'm trying to make a new linux port to the board (the old one was not 
good enough and it has been done by people who aren't there any more) 
and of course, I'm using buildroot :-)

I'm having an error at the end of the kernel compilation : it tries to 
copy zImage from the kernel root, but of course it's located in 
arch/arm/boot/ ... making a simlink works, but I'd like to make it work 
properly.

Sorry to disturb for this, I'm sure I've missed something somewhere, but 
can't figure out where, and I don't find information on google ...

Thanks ...

Pierre.
