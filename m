From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 07:32:26 +0100
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <5501F7C0.5050309@mind.be>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <20150312175527.GO2177@tarshish> <5501F7C0.5050309@mind.be>
Message-ID: <20150313073226.29f6bc55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 12 Mar 2015 21:32:00 +0100, Arnout Vandecappelle wrote:

>  I think it would be easier to extend package/makedevs/makedevs.c to support
> recursive operation.

Yes, I agree. It seems quite usual to need an entire subtree with a
certain set of ownership/permissions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
