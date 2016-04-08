From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 04:34:36 +0200
Subject: [Buildroot] [PATCH] libsrtp: security bump to version 1.5.4
In-Reply-To: <e7defdf081d86eb2f052a4fc77fc329c813a0a75.1460066977.git.baruch@tkos.co.il>
References: <e7defdf081d86eb2f052a4fc77fc329c813a0a75.1460066977.git.baruch@tkos.co.il>
Message-ID: <20160408043436.0d5af4d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Apr 2016 01:09:37 +0300, Baruch Siach wrote:
> Fixes CVE-2015-6360: Prevent potential DoS attack due to lack of bounds
> checking on RTP header CSRC count and extension header length.
> 
> Also, add a hash file.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libsrtp/libsrtp.hash | 2 ++
>  package/libsrtp/libsrtp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/libsrtp/libsrtp.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
