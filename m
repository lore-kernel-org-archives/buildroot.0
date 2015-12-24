From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 09:19:54 +0100
Subject: [Buildroot] [PATCH v2 2/2] tpm-tools: new package
In-Reply-To: <1446659225-30438-2-git-send-email-nrubinstein@aldebaran.com>
References: <1446659225-30438-1-git-send-email-nrubinstein@aldebaran.com>
 <1446659225-30438-2-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20151224091954.294b2167@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Wed,  4 Nov 2015 18:47:05 +0100, No? Rubinstein wrote:
> Signed-off-by: Al West <al.west@v-nova.com>
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> 
> ---

Applied, after doing quite a few changes:

    [Thomas:
     - move from Libraries/Crypto to System tools in menuconfig
     - add patch to fix build with uClibc
     - use 'select' for openssl rather than a 'depends on'
     - propagate trousers dependencies
     - add <pkg>_LICENSE and <pkg>_LICENSEFILES
     - link against libiconv when needed, fixing !locale builds
     - explicitly disable pkcs11 support, since it is not handled by
       tpm-tools.mk currently.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
