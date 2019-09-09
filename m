From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 09:45:08 +0200
Subject: [Buildroot] [PATCH v4 2/5] autobuild-run: initial
 implementation of get_reproducibility_failure_reason()
In-Reply-To: <211178c1-904d-6c32-9ebf-098e3e53db34@mind.be>
References: <20190820145231.15507-1-itsatharva@gmail.com>
 <20190820145231.15507-2-itsatharva@gmail.com>
 <c73a2826-6935-169b-fe2a-836848b225e3@mind.be>
 <20190909004223.24aaed8f@windsurf>
 <211178c1-904d-6c32-9ebf-098e3e53db34@mind.be>
Message-ID: <20190909094508.5ae49851@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Sep 2019 09:35:34 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Yes, but:
> 
> 1. I really think it is there by accident :-)
> 
> 2. For reproducibility failures, I don't think it is that relevant.
> 
> In case a failure was introduced by a version bump, you anyway have to check by
> hand when the version was bumped to be sure that that is really the cause.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
