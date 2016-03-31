From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:46:09 +0200
Subject: [Buildroot] [PATCH] nss: security bump to version 3.23
In-Reply-To: <1459367467-19835-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459367467-19835-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160331034609.3d24fd0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 16:51:07 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-1950 - Fixed a heap-based buffer overflow related to the
> parsing of certain ASN.1 structures. An attacker could create a
> specially-crafted certificate which, when parsed by NSS, would cause a
> crash or execution of arbitrary code with the permissions of the user.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
