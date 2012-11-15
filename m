From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 22:01:06 +0100
Subject: [Buildroot] [PATCH] binutils: add version 2.23.1
In-Reply-To: <50A511F1.6010502@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 15 Nov 2012 13:01:53 -0300")
References: <1352988528-20158-1-git-send-email-gustavo@zacarias.com.ar>
 <87lie25299.fsf@dell.be.48ers.dk>
 <CAFbHwiRBmDSdfWL2pxFRrS-xkRoa0VB_FgrjFDk2oQG42pxeuA@mail.gmail.com>
 <50A5094F.8080001@zacarias.com.ar>
 <CAFbHwiTmCbwarYSgnD7ZkRob7SOVK2T_4Obz6jCR5eJj75j=rA@mail.gmail.com>
 <87haoq510h.fsf@dell.be.48ers.dk> <50A511F1.6010502@zacarias.com.ar>
Message-ID: <87pq3e37jh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 11/15/2012 12:39 PM, Peter Korsgaard wrote:
 >> I agree. Gustavo, could you respin the patch to replace 2.23 with 2.23.1
 >> instead?

 Gustavo> And what about 2.20?

 Gustavo> Hint: you can't say mark it as deprecated and throw the kill
 Gustavo> switch to 2.23 ;-)

Well, the difference is that we have already done releases with 2.20 and
haven't marked it as deprecated yet, whereas 2.23 hasn't been in any
release yet.

It probably makes sense to deprecate 2.20 now, yes.

-- 
Bye, Peter Korsgaard
