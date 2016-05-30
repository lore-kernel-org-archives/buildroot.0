From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 11:59:29 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <20160530095319.GA5804@airbook.vandijck-laurijssen.be> (Kurt Van
 Dijck's message of "Mon, 30 May 2016 11:53:19 +0200")
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
 <20160530111740.14c24236@free-electrons.com>
 <20160530095319.GA5804@airbook.vandijck-laurijssen.be>
Message-ID: <87a8j73lz2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

Hi,

 > I understand the zsh problem, on the other hand,
 > any number prefixed with a 0 is octal, isn't it?

Apparently not to zsh. I haven't found any official notice about it, but
googling around shows this (old!) patch:

http://www.zsh.org/mla/workers/1995/msg00518.html

 > Anyway, I'll re-think the patch too...

Just moving up the SHELL= line above this check should be enough.

-- 
Venlig hilsen,
Peter Korsgaard 
