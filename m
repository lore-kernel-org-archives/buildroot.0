From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 23:47:39 +0100
Subject: [Buildroot] [PATCH] uclibc: get rid of ARC's uClibc fork
In-Reply-To: <562FFAA7.9000205@mind.be> (Arnout Vandecappelle's message of
 "Tue, 27 Oct 2015 23:28:55 +0100")
References: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
 <562FCCF2.8090208@mind.be>
 <20151027225741.333ad3f6@free-electrons.com>
 <562FFAA7.9000205@mind.be>
Message-ID: <87wpu86i9g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>>> In that case, perhaps the snapshot version should be enabled for ARC?
 >> 
 >> To be honest, I am wondering if this snapshot thing is really useful in
 >> any way. Is anyone really using this ? Why do we have this for uClibc
 >> and not for any other package ?

 >  I guess because buildroot was started as a build system for uClibc... The
 > initial version of buildroot (ffde94bd2) even only supported snapshot.

 >  Now that there are actual releases of uClibc, I see little reason to support
 > snapshots. And you anyway can still use _OVERRIDE_SRCDIR.

I agree, we have also dropped snapshot support for busybox and gcc.

-- 
Bye, Peter Korsgaard
