From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Aug 2015 22:59:46 +0200
Subject: [Buildroot] [PATCH] libselinux: mark as not available on ARC
In-Reply-To: <1440009214-13898-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Aug 2015 20:33:34 +0200")
References: <1440009214-13898-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbcb6lkt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libselinux causes some build problems due to the toolchain on ARC,
 > which haven't solved so far. As a temporary solution for Buildroot

s/haven't/haven't been/

Committed, thanks.

-- 
Bye, Peter Korsgaard
