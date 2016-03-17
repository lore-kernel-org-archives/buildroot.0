From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 21:08:36 +0100
Subject: [Buildroot] [PATCH 06/16] uclibc: NPTL thread implementation
	only available on MMU platforms
In-Reply-To: <20160317194551.GV21774@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 17 Mar 2016 20:45:51 +0100")
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <87vb4l5mjg.fsf@dell.be.48ers.dk>
 <20160317141126.46b73ff2@free-electrons.com>
 <20160317194551.GV21774@waldemar-brodkorb.de>
Message-ID: <877fh06f5n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

 > I have once sent a patch to enable m68k support. It needs to be
 > updated and incorporate Arnouts review comments.
 > Is there still interest in reviving m68k support, than I can work on
 > it.

If it works and somebody cares enough about it to look at build errors
and verify that stuff still works at runtime - Then I have absolutely no
problem keeping m68k support.

-- 
Venlig hilsen,
Peter Korsgaard 
