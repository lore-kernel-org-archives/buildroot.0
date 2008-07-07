From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 07:06:37 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20080706062322.87AFD3C667@busybox.net> (ulf@uclibc.org's message
	of "Sat\, 5 Jul 2008 23\:23\:22 -0700 \(PDT\)")
References: <20080706062322.87AFD3C667@busybox.net>
Message-ID: <87abgue10i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-07-05 23:23:21 -0700 (Sat, 05 Jul 2008)
 ulf> New Revision: 22659

 ulf> Log:
 ulf> Avoid duplicate downloading, when rebuilding failed package like libgtk2

Nack, reverting as that breaks source-check/external-deps.

-- 
Bye, Peter Korsgaard
