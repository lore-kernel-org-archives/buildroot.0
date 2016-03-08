From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 17:22:03 +0100
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
 linux compilation error
In-Reply-To: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
Message-ID: <20160308172203.5a8a72a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Sep 2015 10:45:21 +0800, imrehg at gmail.com wrote:
> From: Gergely Imreh <imrehg@gmail.com>
> 
> Replace the "timeconst" perl script with a bc script to fix an
> error due to syntax changes in perl which resulted in linux
> compilation error for the wandboard's 3.8 kernel. The patch is
> backported, kernels from 3.9 onward already have this change.
> 
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>

We finally fixed this problem in a different way, that is generic to
all boards/kernel versions.

See the commit at
https://git.busybox.net/buildroot/commit/linux?id=d6a5d71aba8e21b8aa28d93075a603297d1d3b3c.

Consequently, I've marked your patch as "Rejected" in our patch
tracking system. Thanks for having reported the issue in the first
place!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
