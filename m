From: Nathan Lynch <ntl@pobox.com>
Date: Wed, 13 Jun 2012 18:44:01 -0500
Subject: [Buildroot] [PATCH 7/7] automatically set PARALLEL_JOBS when
 BR2_JLEVEL is 0
In-Reply-To: <4FD921C9.4020302@mind.be>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
 <1339466983-19786-8-git-send-email-ntl@pobox.com> <4FD921C9.4020302@mind.be>
Message-ID: <1339631041.32578.9.camel@doorstop.aus.2wire.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2012-06-14 at 01:27 +0200, Arnout Vandecappelle wrote:
> On 06/12/12 04:09, Nathan Lynch wrote:
> > When BR2_JLEVEL is 0, set PARALLEL_JOBS to the number of CPUs
> > detected.  This allows one to more or less fully utilize the host
> > system without manually tuning the configuration.
> 
>   In my experience, you need 2 times the number of CPUs to fully utilize
> the processor because most compilations have long iowait latencies.

Yeah.  I'm happy to make this change, assuming others agree?

Thanks for having a look!
