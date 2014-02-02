From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Feb 2014 09:10:52 +0100
Subject: [Buildroot] [PATCH 1/1] axel: fixed package download issue
In-Reply-To: <1391258818-19350-1-git-send-email-martin@barkynet.com>
References: <1391258818-19350-1-git-send-email-martin@barkynet.com>
Message-ID: <20140202091052.64e36322@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Sat,  1 Feb 2014 12:46:58 +0000, Martin Bark wrote:
> This patch updates axel.mk to download axel v2.4 from snapshot.debian.org.
> The download from alioth.debian.org is currently broken resulting in a
> malformed axel.2.4.tar.gz being downloaded and the build failing.  The
> package is available instead from snapshot.debian.org.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

As I explained, this problem is not specific to Axel, but to all
package that download from Alioth. So I believe it would be better to
have one single patch that changes all the Alioth URLs to other URLs,
so that we can revert that single patch later on once Alioth is working
again.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
