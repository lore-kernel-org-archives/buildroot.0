From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:56:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: remove icu support from
 0.10.x
In-Reply-To: <1465462113-2963-1-git-send-email-martin@barkynet.com>
References: <1465462113-2963-1-git-send-email-martin@barkynet.com>
Message-ID: <20160609105600.5b839f2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 09:48:33 +0100, Martin Bark wrote:
> icu support was added to nodejs in commit 7d0702a, however, 0.10.x does
> not have support for icu. The 0.10.x configure script will error
> if it is passed the --with-intl option.  This commit removes icu support
> from 0.10.x.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/932e4ec24623592255f234a098f7a90ef2ad8063
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/nodejs.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
