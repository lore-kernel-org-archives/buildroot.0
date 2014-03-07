From: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Date: Fri, 7 Mar 2014 09:52:43 +0100
Subject: [Buildroot] question about buildroot manual license
In-Reply-To: <4c722ce2-e724-45d7-8d5c-d4df3108b842@email.android.com>
References: <20140307063131.GL4148@waldemar-brodkorb.de>
 <4c722ce2-e724-45d7-8d5c-d4df3108b842@email.android.com>
Message-ID: <20140307085243.GM4148@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas De Schampheleire wrote,

> Waldemar Brodkorb <mail@waldemar-brodkorb.de> schreef:
> >Hi developers, 
> >I am reading the buildroot manual and it is nice to read.
> >I would like to add some documentation to my own buildroot derivate,                                                                                                                                      
> Aside from the license question, could you give some more detail about this derivative? How is it different from vanilla Buildroot?

To make a long story short, it started with buildroot 2 in 2005 as I
joined the OpenWrt project. I started working on porting the Linksys
Kernel differences to a new 2.4.x kernel.
https://dev.openwrt.org/browser/trunk/openwrt/package/linux?rev=209

In June 2006 I forked OpenWrt and started with FreeWRT.
http://web.archive.org/web/20060615170828/http://openbsd-geek.de/archives/224-An-open-letter-to-the-OpenWrt-community.html
In Juli 2007 I left the FreeWRT project for personal reasons.
In the middle of 2008 I started to work on a new project called
OpenADK, which based on FreeWRT svn. In May 2009 I started using
Git. 

I am still hacking on embedded Linux systems for fun. At the moment
I like to write some documentation about OpenADK, and the buildroot
docs seems to be a perfect start.

There are a lot of differences between buildroot and OpenADK, I will
add a chapter about it in the planned manual.

best regards,
 Waldemar

P.s.: sorry, that my mail got longer
