From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 12:56:54 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.3.3
In-Reply-To: <1450349958-14230-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450349958-14230-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151217125654.7528ba91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Dec 2015 07:59:18 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-7540 - Remote DoS in Samba (AD) LDAP server
> CVE-2015-3223 - Denial of service in Samba Active Directory server
> CVE-2015-5252 - Insufficient symlink verification in smbd)
> CVE-2015-5299 - Missing access control check in shadow copy code
> CVE-2015-5296 - Samba client requesting encryption vulnerable to
> downgrade attack
> CVE-2015-8467 - Denial of service attack against Windows Active
> Directory server
> CVE-2015-5330 - Remote memory read in Samba LDAP server
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/samba4/samba4.hash | 2 +-
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
