From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 08:12:11 +0100
Subject: [Buildroot] [git commit] package/joe: Add package for the JOE
	editor
In-Reply-To: <874n4hqooi.fsf@dell.be.48ers.dk>
References: <20140202144314.AB1249C730@busybox.osuosl.org>
 <20140202171004.44f5d381@skate> <874n4hqooi.fsf@dell.be.48ers.dk>
Message-ID: <20140203081211.136a60c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 02 Feb 2014 20:50:37 +0100, Peter Korsgaard wrote:

>  > Is this really GPLv1+ ? It is indeed GPLv1, but I'm wondering about the
>  > "+", as I haven't seen any indication in the code about this.
> 
> grep -rls 'any later'                                           ~/source/buildroot/output/build/joe-3.7
> mouse.h
> config.sub
> mouse.c
> COPYING
> missing
> depcomp
> config.guess

Ok, so only a few source files actually have that, and I looked at
several of them, but not mouse.{c,h}.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
