From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 07 Sep 2011 21:48:53 +0200
Subject: [Buildroot] [PATCH 1/3] new package: gssdp
In-Reply-To: <87mxegjfqs.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Wed, 07 Sep 2011 21:48:27 +0200")
References: <1312965667-15157-1-git-send-email-s.neumann@raumfeld.com>
 <87mxegjfqs.fsf@macbook.be.48ers.dk>
Message-ID: <87ipp4jfq2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> ifaddrs.h is only provided if CONFIG_SUPPORT_AI_ADDRCONFIG is enabled,
 Peter> which it isn't by default. We'll probably need to add something like
 Peter> BR2_USE_WCHAR, but I'll do a test build to see what the performance
 Peter> impact is.

s/performance/size/

-- 
Bye, Peter Korsgaard
