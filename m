From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Sun, 11 Sep 2011 08:41:48 -0700
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.7 take 5
In-Reply-To: <87r53ngqzu.fsf@macbook.be.48ers.dk>
References: <4E4DA5E3.9060707@ethertek.ca> <4E4DEB3A.3030402@ethertek.ca>
 <20110819110643.600032d6@skate> <4E4E7D62.2060008@ethertek.ca>
 <4E5207B1.7000409@ethertek.ca> <4E5F9B15.6030905@ethertek.ca>
 <87r53ngqzu.fsf@macbook.be.48ers.dk>
Message-ID: <4E6CD6BC.9090001@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 9/11/2011 6:15 AM, Peter Korsgaard wrote:
>>>>>> "Dan" == Dan Pattison<dan.pattison@ethertek.ca>  writes:
>   Dan>  Old libconfuse version 2.6 is from year 2007 so bump to version 2.7
>   Dan>  Updated download URL in libconfuse.mk
>   Dan>  Updated download URL in Config.in
>   Dan>  Removed libconfuse-2.6-dont-use-werror.patch
>   Dan>  Changed := to just =
>
> Committed thanks. Your mailed had unfortunately word wrapped / mangled
> whitespace so I had to fix it up by hand. Please consider using git
> send-email in the future.
Hello,

I will figure out git send-email next time instead of copy-paste.

This line should be added to the patch;

+LIBCONFUSE_INSTALL_TARGET = YES

Sorry I missed that.

Best Regards,

Dan Pattison
Ethertek Circuits
