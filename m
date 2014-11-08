From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Nov 2014 18:43:03 +0100
Subject: [Buildroot] [PATCH] linux: add option to create kernel tarball
In-Reply-To: <20141108163942.GA3481@free.fr>
References: <1415464367-32108-1-git-send-email-yegorslists@googlemail.com>
 <20141108163942.GA3481@free.fr>
Message-ID: <20141108184303.1607bcb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Yegor,

On Sat, 8 Nov 2014 17:39:42 +0100, Yann E. MORIN wrote:
> Yegor, All,
> 
> On 2014-11-08 17:32 +0100, Yegor Yefremov spake thusly:
> > This option will invoke "make tar-pkg" in kernel's build directory
> > and the resulting linux-*.tar will be copied to images folder.
> 
> Why would we want that only for the kernel?
> 
> If we were to add such a command, we would want to have it for all
> packages, done in a generic way, unless there is a *really* *compelling*
> reason to have such a linux-specific command.

Well, the kernel has this "tar-pkg" target that other packages
typically don't have. However, I'm curious to know what is the use case
for "make tar-pkg" in the kernel in the context of Buildroot.

Yegor?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
