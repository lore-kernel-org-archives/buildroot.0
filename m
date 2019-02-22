From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Feb 2019 13:27:38 +0100
Subject: [Buildroot] [PATCH] libcurl: fix typo in configure option w/o
 OpenSSL
In-Reply-To: <87a7ioko5u.fsf@dell.be.48ers.dk>
References: <20190220013958.24225-1-tpiepho@impinj.com>
 <f8da7da1-0860-547f-e172-f57d7b6f8ad2@mind.be>
 <87a7ioko5u.fsf@dell.be.48ers.dk>
Message-ID: <3b9761a9-2e60-9c6d-e707-ee04169f3c4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/02/2019 13:23, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 20/02/2019 02:40, Trent Piepho wrote:
>  >> When not using OpenSSL, the correct option to configure is --without-ssl
>  >> with two dashes.
>  >> 
>  >> Fixes: b8b78e7e6a ("libcurl: Allow selection of TLS package libcurl will use")
>  >> 
>  >> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> 
>  >  Applied to master, thanks.
> 
>  >  Peter, this is for 2018.11.x
> 
> No it isn't:
> 
> git describe --contains b8b78e7e6a
> 2019.02-rc1~958^2~211

 I thought I hade done exactly that... I guess I was doing too many things at
the same time :-)

 Regards,
 Arnout

> 
> And it hasn't been backported to the 2018.11.x branch.
> 
