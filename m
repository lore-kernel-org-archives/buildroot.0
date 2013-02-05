From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 05 Feb 2013 08:44:35 +0100
Subject: [Buildroot] [PATCH 08/10] liboping: add license information
In-Reply-To: <87sj5by97p.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 05 Feb 2013 00:01:46 +0100")
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
 <1359483839-25357-8-git-send-email-gustavo@zacarias.com.ar>
 <87a9rrbp3n.fsf@dell.be.48ers.dk> <51084F32.5000503@zacarias.com.ar>
 <87sj5by97p.fsf@dell.be.48ers.dk>
Message-ID: <87wqunw6fw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
 Gustavo> On 01/29/2013 07:29 PM, Peter Korsgaard wrote:
 >>> Hmm, I don't see any mention og GPL right away, and only a COPYING file
 >>> (no COPYING.LIB)?

 Gustavo> README
 Gustavo> src/oping.c

 Peter> Ahh yes - Committed, thanks.

But that doesn't work as there's no COPYING.LIB:

http://autobuild.buildroot.org/results/c0bfc03389382235782474b278ca4afd1d283d60/build-end.log

I've changed it to use COPYING instead.

-- 
Bye, Peter Korsgaard
