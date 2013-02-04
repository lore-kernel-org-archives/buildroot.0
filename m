From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 00:05:24 +0100
Subject: [Buildroot] [PATCH 02/10] dialog: add license information
In-Reply-To: <51084F9E.6080408@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 29 Jan 2013 19:39:26 -0300")
References: <1359483839-25357-1-git-send-email-gustavo@zacarias.com.ar>
 <1359483839-25357-2-git-send-email-gustavo@zacarias.com.ar>
 <87zjzrbphn.fsf@dell.be.48ers.dk> <51084F9E.6080408@zacarias.com.ar>
Message-ID: <87obfzy91n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 01/29/2013 07:20 PM, Peter Korsgaard wrote:
 >> None of the source files mention anything else than LGPLv2.1, so I will
 >> drop the +
 >> 
 >> Committed with that change, thanks.

 Gustavo> Actually progressbox.c...

Ahh, you're right. So we have 33 .c files (including the main one) not
listing 'or later', and a single one which does.

What does that mean?

-- 
Bye, Peter Korsgaard
