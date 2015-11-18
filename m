From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:57:57 +0100
Subject: [Buildroot] slang failing on my system | detects host
 libraries/headers
In-Reply-To: <56012DE5.4000909@jcz.nl>
References: <56012DE5.4000909@jcz.nl>
Message-ID: <20151118225757.21a9e770@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jaap Crezee,

On Tue, 22 Sep 2015 12:31:01 +0200, Jaap Crezee wrote:

> compilation terminated.
> Makefile:119: recipe for target 'onig-module.so' failed
> 
> 
> Anybody care to fix that correctly? Here's my quick-and-dirty patch:

Thanks, this problem was fixed a bit later in commit
http://git.buildroot.net/buildroot/commit/package/slang?id=3cd1a9febe6a051db98d737a3bb78c8f461a3af3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
