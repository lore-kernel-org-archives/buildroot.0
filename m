From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 22:55:42 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: webif
	webif/files webif/files/etc webif etc...
In-Reply-To: <20080330204053.E286B3C520@busybox.net> (ulf@uclibc.org's message
	of "Sun\, 30 Mar 2008 13\:40\:53 -0700 \(PDT\)")
References: <20080330204053.E286B3C520@busybox.net>
Message-ID: <87iqz4ylrl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-03-30 13:40:53 -0700 (Sun, 30 Mar 2008)
 ulf> New Revision: 21584

 ulf> Log:
 ulf> Add webif package

 ulf> Added:
 ulf>    trunk/buildroot/package/webif/
 ulf>    trunk/buildroot/package/webif/Config.in

I see that you don't enforce use of the old 0.8.0 version of
haserl. Webif afaik only used to work with that one, not the new 0.9
series - Is that still the case?

-- 
Bye, Peter Korsgaard
