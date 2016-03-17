From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 21:34:55 +0100
Subject: [Buildroot] [PATCH 12/16] elf2flt: use new upstream site and
 add ARM patch
In-Reply-To: <20160317185342.GA6588@vapier.lan>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9F163.5080304@mind.be>
 <20160317091807.4924cfcc@free-electrons.com>
 <20160317185342.GA6588@vapier.lan>
Message-ID: <20160317213455.71df378e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 14:53:42 -0400, Mike Frysinger wrote:

> > No: the Waldemar Git repository did contain the ARM noMMU support. So
> > when switching to the more "official" upstream (which doesn't yet have
> > ARM noMMU support), we need to include the patch adding ARM noMMU
> > support to keep functionality the same.
> 
> elf2flt has had nommu arm support pretty much from the beginning (at
> least since 2002).  i don't know what this patch is for, but it hasn't
> been sent upstream afaik, so i can't really comment on it.

Well, it was sent to the uclinux-dev mailing list just a few days ago:

  http://mailman.uclinux.org/pipermail/uclinux-dev/2016-March/052707.html

I don't know if you call the uclinux-dev mailing list "upstream", but
it doesn't sound too bad for a project hosted at
github.com/uclinux-dev :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
