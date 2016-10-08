From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 08 Oct 2016 18:58:41 -0300
Subject: [Buildroot] [PATCH 2/4] netatop: new package
References: <20161007231920.2a4050e6@free-electrons.com>
Message-ID: <57f96c11c505c_78bc3fbbfa97ee242476d@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Oct 07, 2016 at 06:19 PM, Thomas Petazzoni wrote:
[snip]
> In addition to the kernel module, netatop also builds a daemon,
> netatopd, which gets started by the init script if available. But
> your .mk file does not seem to build the netatopd daemon. Why so?

Short answer ... for no good reason.

While I was creating the patch series I decided to send a small patch.
But I removed too much.
atop and netatop module work without this daemon. But it adds the functionality
of tracking counters of exited processes.

I will add the daemon to the .mk file when I resend.

Thank you for your review.

Regards,
Ricardo
