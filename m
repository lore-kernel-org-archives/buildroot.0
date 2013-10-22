From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 16:18:36 +0200
Subject: [Buildroot] [PATCH] wget: Fix error in texi2pod on Perl 5.18
In-Reply-To: <20131015131633.GA20069@gmail.com> (Andrew Ruder's message of
 "Tue, 15 Oct 2013 08:16:33 -0500")
References: <20131015131633.GA20069@gmail.com>
Message-ID: <87d2mxcrsz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > This gets around the following build errors that occurs on a system with
 > perl 5.18:

 > [...]
 > wget.pod around line 2151: Expected text after =item, not a number
 > wget.pod around line 2156: Expected text after =item, not a number
 > wget.pod around line 2162: Expected text after =item, not a number
 > [...]

 > This is already committed upstream and this patch will be unnecessary in
 > wget 1.15 when it is released:

Committed, thanks.

-- 
Bye, Peter Korsgaard
