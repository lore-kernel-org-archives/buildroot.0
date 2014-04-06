From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:28:50 +0200
Subject: [Buildroot] [[RFC]] toolchain: print actual version of kernel
 headers when checking
In-Reply-To: <1396184370-4204-1-git-send-email-yann.morin.1998@free.fr>
References: <1396184370-4204-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140406142850.74de09ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 30 Mar 2014 14:59:30 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/check-kernel-headers.sh | 39 ++++++++++++++++++++++++++++-----
>  toolchain/helpers.mk                    |  3 +--
>  2 files changed, 35 insertions(+), 7 deletions(-)

I've applied the patch with the following changes:

 * Modified the commit log to add the message you suggested.

 * Fix the coding style: no space after opening parenthesis, no space
   before closing parenthesis.

 * Adjust the error message so that it fits on one line, which I
   believe is clearer.

Also, I'm not entirely sure about the usage of $(uuidgen). Should we use
mktemp instead?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
