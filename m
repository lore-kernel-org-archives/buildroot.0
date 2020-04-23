From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:49:35 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200423202726.GR5035@scaer>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423202726.GR5035@scaer>
Message-ID: <20200423224935.44b7e7ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Apr 2020 22:27:26 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Second, patch 2 does not fix the problem, which is only fixed with patch
> 3. Semantically, the last two patches should be reversed: first fix the
> problem (use of X.509 extension), then add a feature (choice of
> backend).

I thought the idea of patch 2 was that it would allow to select the
BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION option in patch
3, but indeed, it does not. This makes patch 2 and the whole series
even more awkward.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
