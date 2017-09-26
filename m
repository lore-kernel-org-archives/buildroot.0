From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 26 Sep 2017 23:40:02 +0300
Subject: [Buildroot] [PATCH] flex: fix segfaults on glibc-2.26
In-Reply-To: <37665b00-e7c5-330a-0d29-c0c27499737b@mind.be>
References: <20170926123924.GA9085@latitude.localdomain>
 <37665b00-e7c5-330a-0d29-c0c27499737b@mind.be>
Message-ID: <20170926204002.GA22193@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tue, Sep 26, 2017 at 09:29:16PM +0200, Arnout Vandecappelle wrote:

>  This is essentially http://patchwork.ozlabs.org/patch/813474/ but with the
> reference to LEDE and without the fix of the documentation patch. Could you
> merge the two versions?

Sorry, overlooked that one. Marking mine as superseeded, that's exactly
the same patch and it does indeed come from the upstream flex repository.
