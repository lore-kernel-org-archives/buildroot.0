From: Steve Kenton <skenton@ou.edu>
Date: Mon, 19 Jan 2015 08:53:36 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-18
In-Reply-To: <20150119073011.9A959100CDC@stock.ovh.net>
References: <20150119073011.9A959100CDC@stock.ovh.net>
Message-ID: <54BD1A70.7020501@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/19/2015 1:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2015-01-18
> dvdauthor-0.7.1 | 1
>
> Detail of failures
> ===================
>
>          bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/5247ef7cea04245cb87cd38fc721dc645bae24b1/
>          bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results

Looking at the dvdauthor failure on bfin it's obvious that the thread 
mutex functions are missing, but since it only occurs on once platform 
is this a problem with dvdauthor having an unmet thread dependency or a 
problem with the bfin threads?

Steve
