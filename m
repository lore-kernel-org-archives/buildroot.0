From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:52:46 +0100
Subject: [Buildroot] [PATCH] netsnmp: bump to version 5.7.3
In-Reply-To: <1418154513-21366-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418154513-21366-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141210215246.69255e0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Dec 2014 16:48:33 -0300, Gustavo Zacarias wrote:
> Security patch now upstream so remove.
> Add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/netsnmp/netsnmp-001-CVE-2014-2285.patch | 31 -------------------------
>  package/netsnmp/netsnmp.hash                    |  4 ++++
>  package/netsnmp/netsnmp.mk                      |  2 +-
>  3 files changed, 5 insertions(+), 32 deletions(-)
>  delete mode 100644 package/netsnmp/netsnmp-001-CVE-2014-2285.patch
>  create mode 100644 package/netsnmp/netsnmp.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
