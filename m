From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Mon, 23 Sep 2019 15:24:43 +0000
Subject: [Buildroot] [PATCH 1/1] package/xdebug: new package
In-Reply-To: <a288cd11-0a17-3668-0e26-b30b49ef263a@mind.be>
References: <20190923101651.3721-1-nicolas.carrier@orolia.com>
 <0c8218be-8091-e801-cee8-c256a6a67205@mind.be>
 <976365c0a6f51f30929df683cc08465785f36b87.camel@orolia.com>,
 <a288cd11-0a17-3668-0e26-b30b49ef263a@mind.be>
Message-ID: <AM6PR06MB4341B5358F05AD8527DBE0E784850@AM6PR06MB4341.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, thank you again, I'll do a resubmit as soon as I can.
Regards.

Nicolas CARRIER | Senior Development Engineer |  nicolas.carrier at orolia.com<mailto:prenom.nom@orolia.com>



________________________________
From: Arnout Vandecappelle <arnout@mind.be>
Sent: Monday, September 23, 2019 5:05 PM
To: Nicolas Carrier <nicolas.carrier@orolia.com>; buildroot at buildroot.org <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/xdebug: new package



On 23/09/2019 17:01, Nicolas Carrier wrote:
>>> +XDEBUG_VERSION = 2.7.0
>>  There is a 2.7.2 version since May...
> Well, the thing is that the 2.7.0 version is what's in use at Orolia
> ATM, so I'm quite confident that this version would work properly.
> I was also thinking that a later patch could bump the version once it'd
> be properly tested.
>
> So you think that I should bump to 2.7.2 directly?

 If you can test it, please bump directly to 2.7.2, yes. If you can't (don't
have the time), please add to the commit message something like "Version 2.7.2
is out already, but this version hasn't been tested so let's stick to 2.7.0".

 "Test it" means a basic runtime smoke test. I.e. start the debugger on an
actual target. It doesn't mean you have to test all features.

 Regards,
 Arnout
ATTENTION: This email came from an external source.
Do not open attachments or click on links from unknown senders or unexpected emails.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190923/8cf7004e/attachment.html>
