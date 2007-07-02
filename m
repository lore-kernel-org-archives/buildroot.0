From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Mon, 2 Jul 2007 12:29:15 -0500
Subject: [Buildroot] Debugging across uClibc calls
In-Reply-To: <Pine.LNX.4.64.0707021012520.15124@pitt>
References: <Pine.LNX.4.64.0706281628150.7887@pitt>
	<CF7E46FCFF66AD478BB72724345289EC279721@twx-exch01.twacs.local>
	<Pine.LNX.4.64.0707021012520.15124@pitt>
Message-ID: <20070702172915.GA2105@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Thanks for the suggestiron.  I had not been setting the 
> solib-absolute-prefix, and doing so cleared up some error messages I was 
> seeing in GDB, but did not resolve my primary issue.  I still can not step 
> across C library calls.  However, I've found that I can simply set my 
> cursor on the next line and do Continue Until Here (I'm using DDD) to get 
> past it.  Would still be good to figure this out, but at least it's not 
> holding me up.
> 
This is NOT a buildroot question. Please ask these questions on the
uClibc mailing list.

-Steve
