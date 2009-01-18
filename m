From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 11:14:12 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: libgtk2
	multimedia/gst-plugins-base mul etc...
In-Reply-To: <20090118085914.GA9100@zelow.no> (Thomas Lundquist's message of
	"Sun\, 18 Jan 2009 09\:59\:14 +0100")
References: <20090118000558.DC88077108@busybox.osuosl.org>
	<877i4t2i74.fsf@macbook.be.48ers.dk> <20090118085914.GA9100@zelow.no>
Message-ID: <87y6x82a6j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

Hi,

 Thomas> Yup, that's the next step. 

 Thomas> I was pondering about how to find all autotools--mk files and
 Thomas> remove just from them.

All the files using Makefile.autotools.in?

grep -rls AUTOTARGETS package/

-- 
Bye, Peter Korsgaard
