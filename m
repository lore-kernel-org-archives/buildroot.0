From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:59:08 +0200
Subject: [Buildroot] [PATCH v3 3/3] Revert "libsigrok: mark libsigrokcxx
 as broken"
In-Reply-To: <1428659399-28620-4-git-send-email-bgolaszewski@baylibre.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
 <1428659399-28620-4-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150412185908.4ff859b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Fri, 10 Apr 2015 11:49:59 +0200, Bartosz Golaszewski wrote:
> This reverts commit 41e81b7ae149319950814efe3c39acb1200167d2.
> 
> Doxygen dependency issue for libsigrokcxx has been fixed.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libsigrok/Config.in | 3 ---
>  package/pulseview/Config.in | 2 --
>  2 files changed, 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
