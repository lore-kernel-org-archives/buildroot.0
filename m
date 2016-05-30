From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 11:53:19 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <20160530111740.14c24236@free-electrons.com>
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
 <20160530111740.14c24236@free-electrons.com>
Message-ID: <20160530095319.GA5804@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,
> 
> On Mon, 30 May 2016 10:05:58 +0200, Peter Korsgaard wrote:
> 
> > Sorry, I misremembered. This logic is above the line where we assign
> > bash to SHELL, so it runs with /bin/sh as shell. On my system, this is
> > dash and it behaves like bash in this regard. What shell do you use?
> 
> From the Kurt's previous e-mails, I believe he is using mksh as his
> shell.

indeed, mksh it is.

I understand the zsh problem, on the other hand,
any number prefixed with a 0 is octal, isn't it?

Anyway, I'll re-think the patch too...

Kurt
