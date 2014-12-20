From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:54:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/oprofile: Bump version to 1.0.0
In-Reply-To: <1418626935-5023-1-git-send-email-ilya.lipnitskiy@gmail.com>
References: <1418626935-5023-1-git-send-email-ilya.lipnitskiy@gmail.com>
Message-ID: <20141220215439.3ee9ce0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ilya Lipnitskiy,

On Sun, 14 Dec 2014 23:02:15 -0800, Ilya Lipnitskiy wrote:
> Remove opcontrol and oprofiled from the install list, they are no longer
> present in the package.
> 
> Remove all patches, they have been integrated upstream.
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  .../oprofile-001-avr32-enable-lookup_dcookie.patch | 24 -------
>  ...-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch | 78 ----------------------
>  ...e-fix-test-for-synth-check-with-GCC-4.9.0.patch | 45 -------------
>  package/oprofile/oprofile.mk                       |  5 +-
>  4 files changed, 2 insertions(+), 150 deletions(-)
>  delete mode 100644 package/oprofile/oprofile-001-avr32-enable-lookup_dcookie.patch
>  delete mode 100644 package/oprofile/oprofile-002-Fix-compile-error-on-ppc-uClibc-platform-AT_BASE_PLA.patch
>  delete mode 100644 package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch

Applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
