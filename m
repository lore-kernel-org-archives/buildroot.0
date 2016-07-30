From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:35:33 +0200
Subject: [Buildroot] [PATCH v2] tinydtls: new package
In-Reply-To: <1469690047-26251-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469690047-26251-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160730153533.2ddb30e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 09:14:07 +0200, Fabrice Fontaine wrote:
> tinydtls is a library for Datagram Transport Layer Security
> (DTLS) covering both the client and the server state machine.
> It is implemented in C and provides support for the mandatory
> cipher suites specified in CoAP.
> 
> https://sourceforge.net/projects/tinydtls
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add a patch to fix build of tests subdirectory which depends on the
>    tinydtls library
>  - Remove definition of TINYDTLS_SOURCE as this is the default value
>  - Put TINYDTLS_SITE on a single line even if it is slightly overflows
>    the normal length
>  - Rename TINYDLTS_RELEASE in TINYDLTS_REL so it's shorter
>  - Use tinydlts.h as the TINYDTLS_LICENSE_FILES

Applied to master, thanks. Please submit your two patches to the
upstream project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
