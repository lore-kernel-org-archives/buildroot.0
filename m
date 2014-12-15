From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 07:53:01 +0100
Subject: [Buildroot] [PATCH] erlang: bump to version 17.4
In-Reply-To: <87vblfrkao.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 13 Dec 2014 10:06:07 +0100")
References: <1418411483-29636-1-git-send-email-fhunleth@troodon-software.com>
 <87vblfrkao.fsf@dell.be.48ers.dk>
Message-ID: <87mw6pmmk2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
 >> Erlang/OTP 17.4 is a service release on the 17 track with mostly bug
 >> fixes, but it does contain a number of new features and characteristics
 >> improvements as well.

 >> Some highlights of the release are:

 >> - eldap: Nearly all TCP options are possible to give in the
 >> eldap:open/2 call.
 >> - ssh: Added API functions ptty_alloc/3 and ptty_alloc/4, to allocate a
 >> pseudo tty.
 >> - ssl: Handle servers that may send an empty SNI extension to the client.

 >> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

 > Committed, thanks.

It seems to cause some build issues on ARM. Care to take a look?

http://autobuild.buildroot.net/?reason=erlang-17.4

-- 
Bye, Peter Korsgaard
