From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 22:58:16 +0200
Subject: [Buildroot] [PATCH] bcusdk: fix endless recursion when opening
 USB backends
In-Reply-To: <20170825204757.GB6442@airbook.vandijck-laurijssen.be>
References: <1503645999-14791-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20170825160004.5c2356df@windsurf>
 <20170825193652.GA6442@airbook.vandijck-laurijssen.be>
 <20170825221617.36a5d7c1@windsurf>
 <20170825204757.GB6442@airbook.vandijck-laurijssen.be>
Message-ID: <20170825225816.062a2818@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Aug 2017 22:47:57 +0200, Kurt Van Dijck wrote:

> > https://sourceforge.net/p/bcusdk/code/ci/master/tree/ is a Git
> > repository.  
> 
> One day, I'll switch to https://github.com/knxd/knxd anyway.

Interesting. I see it's a fork of bcusdk. So perhaps we could drop the
bcusdk package at some point, and replace it with a knxd package.
Indeed, knxd seems to be actively maintained, which isn't the case of
bcusdk.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
