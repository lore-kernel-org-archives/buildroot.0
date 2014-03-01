From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 15:44:36 +0100
Subject: [Buildroot] [PATCH] php-gnupg: new package
In-Reply-To: <1393359365-21266-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393359365-21266-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301154436.3b7be77e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 25 Feb 2014 17:16:05 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in              |  1 +
>  package/php-gnupg/Config.in    |  9 +++++++++
>  package/php-gnupg/php-gnupg.mk | 23 +++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 package/php-gnupg/Config.in
>  create mode 100644 package/php-gnupg/php-gnupg.mk

This package is causing some build issues, see
http://autobuild.buildroot.org/results/efb/efbce29a2fa1d8561c10613d2145b9b382ddc83c/:

checking for gawk... gawk
checking for gnupg support... yes, shared
checking for gnupg files in default path... not found
configure: error: Please reinstall the gpgme distribution
make: *** [/data/scratch/peko/build/php-gnupg-1.3.3/.stamp_configured] Error 1

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
