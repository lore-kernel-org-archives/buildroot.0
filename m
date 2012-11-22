From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 11:58:14 +0100
Subject: [Buildroot] output/target isn't synced with the actual target
In-Reply-To: <CAJH6qSeGCdkP7rZL7iVxRoHXu6n0R-26K+kTqxH3MB6zVyUO3A@mail.gmail.com>
References: <CAJH6qSeGCdkP7rZL7iVxRoHXu6n0R-26K+kTqxH3MB6zVyUO3A@mail.gmail.com>
Message-ID: <20121122115814.18adfcd2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vadim Malenboim,

On Thu, 22 Nov 2012 11:01:26 +0200, Vadim Malenboim wrote:

> I have libs in output/target/usr/lib but nothing on the actual target.
> In addition no all libs that are present in output/target/lib are actually
> present on the target.

Well, are you sure you did reflash/transfer the new root filesystem
image to your target?

If you want to check, enable the generation of a "tar" image in
Buildroot, and verify that all files are properly in the tarball.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
