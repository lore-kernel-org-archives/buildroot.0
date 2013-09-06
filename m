From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 19:49:03 +0200
Subject: [Buildroot] [PATCH 00/17] SELinux Buildroot Additions
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130906194903.28c020ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 4 Sep 2013 18:09:39 -0500, Clayton Shotwell wrote:
> Submitting an initial patch set to add SELinux support to Buildroot.
> This patch set adds packages required for an SELinux system along with
> the packages needed to build them.

Thanks Clayton for these patches. They are definitely interesting, but
as you've seen they are also quite big and therefore will take a bit of
time to review and get merged.

In order to ease the review process, would it be possible to get a
short introduction to SELinux, and especially what tools are needed on
the host, what tools are needed on the target? I'm especially
interested in understanding why/if we need all this Python stuff on the
target.

So essentially, having an overview of the patch series would be nice:
what the various packages are doing (you can skip the basic stuff like
ustr), and how they "interact" with each other.

Thanks a lot again for this contribution!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
