From: Nick Peirson <nick@netcentral.co.uk>
Date: Thu, 18 Sep 2008 09:49:17 +0100
Subject: [Buildroot] Lighttpd and PCRE
In-Reply-To: <48D20A45.6030308@netcentral.co.uk>
References: <48D0CDD3.4070604@netcentral.co.uk>	<87ljxqsbep.fsf@macbook.be.48ers.dk>
	<48D20A45.6030308@netcentral.co.uk>
Message-ID: <48D2160D.5060308@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nick Peirson wrote:
> Peter Korsgaard wrote:
>   
>> Yeah, that's caused by pcre-config returning /usr/lib instead of
>> $(STAGING_DIR)/usr/lib - I've fixed that now.
>>
>> With those fixes pcre/lighttpd builds for me (arm9) - Does it still
>> not work for you?
>>     
> I'm recompiling now. Thanks for looking at this so quickly, I'll let you
> know if that fixes it.

lighttpd is now compiling happily and running with PCRE support. Thank 
you very much for your help!

Nick
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080918/88f790e5/attachment.htm 
