From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:11:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: Add patch to
 fix build error with musl
In-Reply-To: <1417644227-16408-1-git-send-email-jkrause@posteo.de>
References: <1417644227-16408-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141207221114.1dccf63c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed,  3 Dec 2014 23:03:47 +0100, J?rg Krause wrote:
> Add a patch to allow building wpa_supplicant with the musl C library.
> 
> Building wpa_supplicant with the musl C library fails since musl does not
> define type names such as '__uint32_t'. To support building wpa_supplicant
> with the musl C library use the integer types declared in the ISO C standard
> header file <stdint.h>.
> 
> Patch is sent upstream:
> http://lists.shmoo.com/pipermail/hostap/2014-December/031464.html
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
