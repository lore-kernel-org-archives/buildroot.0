From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 25 Mar 2015 23:26:17 +0200
Subject: [Buildroot] [PATCH] aiccu: musl patches
In-Reply-To: <20150325200955.6a0e54c7@free-electrons.com>
References: <20150324223049.GA4134@vostro>
 <20150325200955.6a0e54c7@free-electrons.com>
Message-ID: <20150325212617.GA24658@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wed, Mar 25, 2015 at 08:09:55PM +0100, Thomas Petazzoni wrote:

> >  package/aiccu/0004-if-ether-header.patch | 23 +++++++++++++++++++++++
> >  package/aiccu/0005-res-ninit.patch       | 22 ++++++++++++++++++++++
> 
> Thanks. What is the upstreaming plan for those patches?

None I'd say, their last release is 8 years old and patches 0001-0003
have been around for quite some time as well.

By the way, please disregard this patch. I just realized 0001 does
exactly the same thing for uclibc that I did with 0005 for musl.
It's better to merge them.
