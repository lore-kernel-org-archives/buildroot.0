From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jun 2010 09:13:54 +0200
Subject: [Buildroot] Regarding my package patches
In-Reply-To: <201006010028.26531.PeterHuewe@gmx.de>
References: <201006010028.26531.PeterHuewe@gmx.de>
Message-ID: <20100601091354.62b68e4b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Please use the Buildroot list for this kind of request. I'm Cc-ing the
list because the answer to your query contains general information that
may be useful to others.

On Tue, 1 Jun 2010 00:28:26 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> is there still something wrong with my patches?

No, I think they went through the review process quite well. There
might be some additional comments from Peter Korsgaard (Buildroot
maintainer, the only person who can merge patches) who didn't review
them yet, but in general, they look good.

> Or is there a reason they don't get merged.

The reason is simple and has nothing to do with your patches
specifically, it it related to the development process of Buildroot.

We deliver a release on a fixed schedule, every 3 months: 2010.02,
2010.05, 2010.08. So, when you sent your patches (mid-May), we were
very close to the end of the release process for 2010.05 (which has
just been released two days ago). So at that time, Peter was not
accepting patches adding new features, but only obvious bug fixes.

Now that 2010.05 has been released, for the following ~2 months, Peter
can merge new features. So we have around late July to send our new
features and try to get them merged. That's the reason why I sent my
47-patch-bomb yesterday night.

So you can expect your patches fairly soon now, but it may take another
week to allow Peter to look at the backlog of pending patches.

I hope you understand how our release process works. If you have any
question or comment, don't hesitate to ask for additional
clarifications.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
