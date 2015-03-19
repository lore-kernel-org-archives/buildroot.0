From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 09:16:24 +0100
Subject: [Buildroot] [git commit] package/luajit: introducing luajit
 arch supports.
In-Reply-To: <550A1040.9070503@mind.be>
References: <20150317170322.4A9F981829@busybox.osuosl.org>
 <550A1040.9070503@mind.be>
Message-ID: <20150319091624.41079fe9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 19 Mar 2015 00:54:40 +0100, Arnout Vandecappelle wrote:

> >  config BR2_PACKAGE_LUAJIT
> >  	bool "luajit"
> >  	select BR2_PACKAGE_HAS_LUAINTERPRETER
> >  	# Luajit is only available for some target architectures, and
> >  	# has some complexity wrt 32/64. See luajit.mk for details.
> 
>  Shouldn't the comment also have moved?

Absolutely, good point.

>  Also, ljlinenoise and ljsyscall should probably use it.

There are patches already sent to do this, but since they were not
changing to the same set of architectures, I did not apply them before
having some more explanations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
