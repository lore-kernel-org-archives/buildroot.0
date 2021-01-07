From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jan 2021 22:48:00 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/coremark: new package
In-Reply-To: <20201111224102.28799-1-judge.packham@gmail.com>
References: <20201111224102.28799-1-judge.packham@gmail.com>
Message-ID: <04d0d6ca-1c24-2b1f-4a84-4cb6ed7663d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Chris,

On 11/11/2020 23:41, Chris Packham wrote:
> CoreMark is a simple, yet sophisticated benchmark that is designed
> specifically to test the functionality of a processor core. Running
> CoreMark produces a single-number score allowing users to make quick
> comparisons between processors.
> 
> https://www.eembc.org/coremark/
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

 Matt tested the first iteration of this patch, so you should keep his Tested-by
tag (otherwise it gets lost...).

 With that, applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes in v2:
> - None
[snip]
