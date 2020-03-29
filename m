From: Stefan Ott <stefan@ott.net>
Date: Sun, 29 Mar 2020 19:00:57 +0200
Subject: [Buildroot] [PATCH 1/1] unbound: new package
In-Reply-To: <20200321123708.GA13284@scaer>
References: <20200321005706.22235-1-stefan@ott.net>
 <20200321123708.GA13284@scaer>
Message-ID: <20200329170057.GG18598@greebo.asti.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann

On Sat, Mar 21, 2020 at 01:37:08PM +0100, Yann E. MORIN wrote:
> 
> In addition to the review by Yegor and Thomas, and as discussed on IRC
> the other day: unbound at least requires threads, probably even NPTL.

I investigated a bit and while it doesn't strictly require pthreads
(i.e., there is an option to compile it without them), if pthreads are
enabled it *does* required NPTL.

A new patch that adjusts the build script accordingly should be ready
later tonight.


Kind regards
-- 
Stefan Ott
https://www.ott.net/
