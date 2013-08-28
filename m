From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 18:13:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] nios2: Add new architecture
In-Reply-To: <1377115128-29749-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377115128-29749-2-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <20130828181333.208c00ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 21 Aug 2013 16:58:47 -0300, Ezequiel Garcia wrote:
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> This commit adds very basic support to build for the Nios II
> architecture. Toolchain support is still missing and instead
> we need to use an external custom toolchain.
> 
> Notice that this architecture had been previously removed in
> Buildroot 2010.05-rc1 release (as explained in the CHANGES file)
> and this commit adds it back.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
