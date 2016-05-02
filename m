From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 2 May 2016 12:26:49 -0300
Subject: [Buildroot] [PATCH] x264: needs mmu
In-Reply-To: <87inywqy9f.fsf@dell.be.48ers.dk>
References: <1462193087-19193-1-git-send-email-gustavo@zacarias.com.ar>
 <87inywqy9f.fsf@dell.be.48ers.dk>
Message-ID: <572771B9.6080807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/16 12:23, Peter Korsgaard wrote:

> Hmm, is that really generally true? I don't quite see why you cannot
> have madvise() without mmu. Looking at uClibc-ng, the option enabling
> madvise support doesn't depend on MMU support.

I've based the rule on previous 80b9dfce, 5b309e1a and 8d446718 
scenarios and didn't investigate myself.
Regards.
