From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Feb 2015 20:56:43 +0100
Subject: [Buildroot] [PATCH] cryptsetup: remove hard dependency on
 libgcrypt
In-Reply-To: <1423074809-602-1-git-send-email-bos@je-eigen-domein.nl>
References: <1423074809-602-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150204205643.036b3e61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Wed,  4 Feb 2015 19:33:28 +0100, Floris Bos wrote:

> - Removes CRYPTSETUP_AUTORECONF as it is redundant, and reconf does
> create a dependency on libgcrypt for the m4 macros used.

This essentially reverts commit
d66c981aaa2248b7e20a4f802f3643435a1761ca, which was made to fix
http://autobuild.buildroot.net/results/9ca/9cad1cf49ee6b5c58d8260ee33beef2e6c1ada4d/.

Can you rebuild the same configuration and see if with your patch it
builds fine?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
