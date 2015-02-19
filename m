From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 23:23:33 +0100
Subject: [Buildroot] [PATCH] netsnmp: Add option for using minimal
 internal SSL code
In-Reply-To: <1424187797-620-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424187797-620-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150219232333.0d49a185@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan S?rensen,

On Tue, 17 Feb 2015 16:43:17 +0100, Stefan S?rensen wrote:
> Add option for enabling a minimal internal copy of OpenSSL usable for USM
> security. It will not enable the usage of SNMP over (D)TLS.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/netsnmp/Config.in  | 7 +++++++
>  package/netsnmp/netsnmp.mk | 4 ++++
>  2 files changed, 11 insertions(+)

Thanks, applied to next, after doing a minor change:

    [Thomas: use 'else ifeq' to avoid having another nested ifeq ... endif
    block.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
