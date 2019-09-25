From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Sep 2019 15:02:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/php-xdebug: new package
In-Reply-To: <f24884d9b449983b9630d2a5ab43823ec586affa.camel@orolia.com>
References: <20190925114456.16388-1-nicolas.carrier@orolia.com>
 <f24884d9b449983b9630d2a5ab43823ec586affa.camel@orolia.com>
Message-ID: <9dff4753-bef6-231f-a224-63382b459dd6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nicolas,


On 25/09/2019 14:00, Nicolas Carrier wrote:
> Hello,
> I tried to address all your comments, but:
[snip]
>  * I didn't manage either to use check-package. I ran:
>        $ ./utils/check-package package/php-xdebug/*
>    _before_ fixing the two errors Arnout mentioned in the Config.in,
>    but just got:
>        36 lines processed
>        0 warnings generated

 Indeed, it looks like the checking of Config.in is more limited than I thought.
I'll put it on my todo list :-)


 Regards,
 Arnout
