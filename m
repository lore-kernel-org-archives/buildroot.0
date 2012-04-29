From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Apr 2012 07:49:38 -0300
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <87ehr77x56.fsf@macbook.be.48ers.dk>
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <20120426164511.2f6e462d@skate> <20120427005558.GA20161@game.jcrosoft.org>
 <201204272354.58069.arnout@mind.be> <87ehr77x56.fsf@macbook.be.48ers.dk>
Message-ID: <0b7f188348202f2659d282db3b748fb4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-29 05:36, Peter Korsgaard wrote:

> True. But the first thing to decide on is if this _SHOW_OTHERS option 
> is
> really useful. It was afaik introduced long time ago to encourage 
> people
> to use the busybox applets instead of the full blown versions, but
> perhaps we should just let people decide for themselves?

I'd just kill it altogether, i'm not a fan of hidden options since 
they're prone to noise (people asking where it is) if they can be 
avoided.
And probably use Arnout's idea of appending it to the menu text or 
help.
Regards.
