From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 11:23:08 +0100
Subject: [Buildroot] [PATCH 1/1] alljoyn: fix build on or1k
In-Reply-To: <20170217145942.28eed5ff@free-electrons.com>
References: <1487339732-29587-1-git-send-email-fabrice.fontaine@orange.com>
 <20170217145942.28eed5ff@free-electrons.com>
Message-ID: <20170221112308.17a07a16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 14:59:42 +0100, Thomas Petazzoni wrote:

> Do we understand why it's happening only on or1k ?
> 
> or1k is using some gcc 5.x compiler, so we should see the same problem
> with other gcc 5.x toolchains, no ?

As I suspected, patching alljoyn is not necessary, it was a missing
patch in the gcc version for or1k. This has been fixed in commit
https://git.buildroot.org/buildroot/commit/?id=e7c7a8bf5481e898e7591442b0d924c2952797ef.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
