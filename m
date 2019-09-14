From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat, 14 Sep 2019 13:17:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/haveged: bump to version 1.9.6
In-Reply-To: <87blvrunuw.fsf@dell.be.48ers.dk>
References: <1568142431-9159-1-git-send-email-pjtexier@koncepto.io>
 <87blvrunuw.fsf@dell.be.48ers.dk>
Message-ID: <9ce27703-e67a-6cb6-97cc-9cd3b6f82c4b@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le 11/09/2019 ? 12:30, Peter Korsgaard a ?crit?:
>   > f219358 Fix segfault on arm machine >
> Given this, should this version bump also be backported to 2019.02.x and

I think so.

> 2019.08.x? Do you know when the issue was introduced?

I don't know :/, but after a quick look, it seems that the problem
is not completely solved [1].

Thanks !

[1] - https://github.com/jirka-h/haveged/pull/7
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
