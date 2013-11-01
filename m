From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:28:22 +0100
Subject: [Buildroot] [PATCH] strongswan: add security patches
In-Reply-To: <1383314067-26982-1-git-send-email-gustavo@zacarias.com.ar>
References: <1383314067-26982-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131101152822.3e6900e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  1 Nov 2013 10:54:27 -0300, Gustavo Zacarias wrote:
> Security patches to fix CVE-2013-5018, CVE-2013-6075 and CVE-2013-6076.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../strongswan-0003-CVE-2013-5018-fix.patch        | 29 ++++++++++++++++++++++
>  .../strongswan-0004-CVE-2013-6075-fix.patch        | 27 ++++++++++++++++++++
>  .../strongswan-0005-CVE-2013-6076-fix.patch        | 27 ++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 package/strongswan/strongswan-0003-CVE-2013-5018-fix.patch
>  create mode 100644 package/strongswan/strongswan-0004-CVE-2013-6075-fix.patch
>  create mode 100644 package/strongswan/strongswan-0005-CVE-2013-6076-fix.patch

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
