From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Dec 2009 21:05:43 +0100
Subject: [Buildroot] How to include GCC into Target?
In-Reply-To: <1592036284.20091214194320@centerless-automation.com> (Ramon
	Wicki's message of "Mon, 14 Dec 2009 19:43:20 +0100")
References: <1592036284.20091214194320@centerless-automation.com>
Message-ID: <87ocm1qq20.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ramon" == Ramon Wicki <ramonwicki_nospam@centerless-automation.com> writes:

 Ramon> Hello,
 Ramon> I know, for you this may sound noob. But I just couldn't find any way,
 Ramon> to configure buildroot to include gcc into the target FS.
 Ramon> What options do I have to configure for that?

 Ramon> I just need a target in which in can also compile...

Package -> native toolchain in the target filesystem

Build options -> development files in target filesystem is also needed.

Notice that this isn't a common setup, so you might run into trouble.

-- 
Bye, Peter Korsgaard
