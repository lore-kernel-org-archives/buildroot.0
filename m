From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Sep 2019 16:50:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/haveged: bump to version 1.9.6
In-Reply-To: <9ce27703-e67a-6cb6-97cc-9cd3b6f82c4b@koncepto.io> (Pierre-Jean
 Texier's message of "Sat, 14 Sep 2019 13:17:48 +0200")
References: <1568142431-9159-1-git-send-email-pjtexier@koncepto.io>
 <87blvrunuw.fsf@dell.be.48ers.dk>
 <9ce27703-e67a-6cb6-97cc-9cd3b6f82c4b@koncepto.io>
Message-ID: <87o8z9n3yl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > Hello Peter,
 > Le 11/09/2019 ? 12:30, Peter Korsgaard a ?crit?:
 >> > f219358 Fix segfault on arm machine >
 >> Given this, should this version bump also be backported to 2019.02.x and

 > I think so.

 >> 2019.08.x? Do you know when the issue was introduced?

 > I don't know :/, but after a quick look, it seems that the problem
 > is not completely solved [1].

:/

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
