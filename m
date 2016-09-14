From: Vineet Gupta <vgupta@synopsys.com>
Date: Wed, 14 Sep 2016 13:18:16 -0700
Subject: [Buildroot] Stripping kernel modules for ARC
In-Reply-To: <87mvjafe5t.fsf@dell.be.48ers.dk>
References: <1473852437.3766.15.camel@synopsys.com>
 <d1ed5472-3500-45fc-eb0f-bdd2d6afb441@synopsys.com>
 <87mvjafe5t.fsf@dell.be.48ers.dk>
Message-ID: <0d77ca65-297c-4454-c4ab-7931b7346134@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/14/2016 12:57 PM, Peter Korsgaard wrote:
>  >> The problem in hand is kernel stack unwinding on ARC historically was done
>  >> with use of debug_frame instead of more common eh_frame. 
> 
>  > Just for the record, I will be switching kernel unwinder to .eh_frame anyways -
>  > it's just taking longer than I hoped to. So there is no need to do anything
>  > special for .debug_frame - not as of now.
> 
> Ok, what kind of time frame are we looking at? Within the 2016.11 cycle
> or longer?

What kernel will this BR release be. My changes will go into 4.9.

-Vineet
