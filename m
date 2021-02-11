From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Feb 2021 14:25:27 +0100
Subject: [Buildroot] Failed pipeline for 2021.02-rc1 | buildroot |
 92237c45
In-Reply-To: <52768bbb-e4a1-b389-dff0-2e85bf954f1e@mind.be>
References: <602456474c4eb_b2ab5a703162be@gitlab-sidekiq-catchall-v1-6d55b89d66-6zn9h.mail>
 <6594f32e-a013-2622-20a8-91cf6edf568a@essensium.com>
 <87blcqke1z.fsf@dell.be.48ers.dk>
 <20210211132135.5e39993c@windsurf.home>
 <52768bbb-e4a1-b389-dff0-2e85bf954f1e@mind.be>
Message-ID: <20210211142527.334bd9f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Feb 2021 13:49:28 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  However, for the tests, I added the developers of the package that is tested to
> Cc here, so that might help.

The daily e-mail logic is also smart enough to associate runtime test
failures in Gitlab CI with the maintainers of those tests. However, the
DEVELOPERS must obviously be up-to-date for this to work. So if you
have found appropriate developers to associate to specific runtime
tests, don't hesitate to update the DEVELOPERS accordingly.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
