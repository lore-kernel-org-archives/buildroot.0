From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 10:39:58 +0100
Subject: [Buildroot] [PATCH v2 3/3] Add test infrastructure
In-Reply-To: <1330866196-5360-3-git-send-email-arnout@mind.be>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
 <1330866196-5360-3-git-send-email-arnout@mind.be>
Message-ID: <20120305103958.11ed7a70@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  4 Mar 2012 14:03:16 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> The test infrastructure is a script and a list of tests to be run.
> Additional test configurations can be added later to the test directory.

I know Peter has some test scripts as well, and so I have. Maybe we
should first share what we have, and see what we can factorize?

In any case, this test infrastructure discussion should really be part
of a separate set of patches. While your first two patches can be
merged without much discussion, this third patch really requires some
discussion. I don't want this test infrastructure to be the thing used
only by one person, it needs to be used and usable by others.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
