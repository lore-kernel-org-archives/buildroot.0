From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 18 Sep 2008 10:58:53 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/aumix
In-Reply-To: <87bpylq1a1.fsf@macbook.be.48ers.dk>
References: <20080918084256.E277B3C64F@busybox.net>
	<87bpylq1a1.fsf@macbook.be.48ers.dk>
Message-ID: <20080918105853.116bb837@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Sep 2008 10:57:42 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "egtvedt" == egtvedt  <egtvedt@uclibc.org> writes:
> 
> Hi,
> 
>  egtvedt> Log:
>  egtvedt> aumix: fix install rule to target to support multiple
>  egtvedt> projects
> 
>  egtvedt> This patch will let aumix depend on an installed file on the
>  egtvedt> target root file system instead of touched file.
> 
> How about converting it to Makefile.autotools.in while you're at it?
> ;)
> 

I noticed that as well ;) But I do not really use the package, just
noticed the bug.

-- 
Best regards,
Hans-Christian Egtvedt
