From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 10:13:30 -0500
Subject: [Buildroot] [PATCH] pseudo-wrapper: fix console issue
In-Reply-To: <8f7c859a-7d90-574f-191b-3ffb595b053d@mind.be>
References: <20161123053220.1845-1-gael.portay@savoirfairelinux.com>
 <8f7c859a-7d90-574f-191b-3ffb595b053d@mind.be>
Message-ID: <20161123151329.qqjwonmqztctdsfa@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2016 at 11:02:18AM +0100, Arnout Vandecappelle wrote:
>  Hi Ga?l,
> 
>  I hope you don't mind my nitpicking on English :-)
> 

No worries. I am a bloody french with a terrible english :(

I am glad you made a pass on the commit message.

>  Instead of killing, use "pseudo -S". It does essentially the same thing but
> it's cleaner IMHO.
> 

Okay, I will do the modifications, test them and resend a patch in the next
couple of hour.
