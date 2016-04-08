From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 10:20:02 +0200
Subject: [Buildroot] [PATCH v3 01/10] uclibc: use upstreamed patch for
	ARM Thumb simplification
In-Reply-To: <1459450815-6494-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 31 Mar 2016 21:00:06 +0200")
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zit4pl59.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The uClibc patches to simplify the ARM Thumb configuration options
 > have been merged, but instead of being 5 separate patches, they have
 > been merged as a single patch.

 > This commit updates the Buildroot uClibc package to use the patch that
 > was actually upstreamed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
