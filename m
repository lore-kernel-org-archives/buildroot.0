From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 22:22:02 +0100
Subject: [Buildroot] socat version
In-Reply-To: <CANxTyt5UVteo4xOJ85YfZP4J-3ZpVstGjnr8Yj4Sry93zfUqzg@mail.gmail.com>
 (Danomi Manchego's message of "Tue, 4 Nov 2014 07:58:35 -0500")
References: <CANxTyt5UVteo4xOJ85YfZP4J-3ZpVstGjnr8Yj4Sry93zfUqzg@mail.gmail.com>
Message-ID: <874mu9tmkl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > All,
 > Buildroot has been using the socat 2.0.0 series for a while.  We
 > recently ran into a socat issue which was fixed upstream, but in a
 > 1.7.2.4 release.  For rears, the socat people released a version 1
 > release and a version 2 release in tandem, but for some reason, the
 > latest release was only 1.7.2.4.  Reading about socat 2 at
 > http://www.dest-unreach.org/socat/socat-version2.html I see it is
 > (was?) described as "beta".

 > So I was wondering: is buildroot on the 2.0.0 series under the
 > normally sane presumption that 2.0 must be newer than 1.7, or is there
 > an actual preference for the version 2 releases?

I don't think there's any real reason that we've gone with 2.0 series. I
atleast wasn't aware of the two branches. We moved from 1.4 to 2.0 a
long time ago (back when we used subversion), and the person doing the
change is no longer active.

commit 3fde5702db832475c4a45aa3f35aac7839c6a710
Author: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date:   Fri Jan 2 08:29:31 2009 +0000

    Bump socat version, optionally add configure variables

Gustavo, you have recently bumped the version - Do you have anything to
add?

-- 
Bye, Peter Korsgaard
