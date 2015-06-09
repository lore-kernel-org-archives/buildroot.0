From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:44:15 +0200
Subject: [Buildroot] [PATCH] strongswan: security bump to version 5.3.2
In-Reply-To: <1433771406-17543-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433771406-17543-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150609224415.600e3bc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  8 Jun 2015 10:50:06 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2015-4171 - rogue servers with a valid certificate
> accepted by the client to trick it into disclosing its username and even
> password (if the client accepts EAP-GTC).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/strongswan/strongswan.hash | 4 ++--
>  package/strongswan/strongswan.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
