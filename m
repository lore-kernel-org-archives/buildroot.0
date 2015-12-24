From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 12:18:18 +0100
Subject: [Buildroot] buildroot support for OrangePI PC
In-Reply-To: <D4ED5787-D6C8-4B61-BDC1-8834ED93FB8D@xiot.nl>
References: <56748758.7040908@mind.be> <1450948540529.50320.154990@webmail2>
 <20151224112859.6f44713d@free-electrons.com>
 <D4ED5787-D6C8-4B61-BDC1-8834ED93FB8D@xiot.nl>
Message-ID: <20151224121818.5532e97b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EElco,

On Thu, 24 Dec 2015 11:52:46 +0100, Eelco Chaudron wrote:

> Will take a look at your comments and make the fixes and send you a patch.
> 
> One quick question on the linux header part; This is a 4.4 based kernel, and no headers are
> available when specifying the version (as they live in a different directory on kernel.org).
> 
> Guess I should force them to 4.3 for now.

Yes, the final 4.4 is not yet released, so you can't point to 4.4 for
the kernel headers. Using 4.3 for the kernel headers is perfectly fine
in the mean time.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
