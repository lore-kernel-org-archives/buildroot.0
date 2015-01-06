From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:49:25 +0100
Subject: [Buildroot] [PATCH 1/2] strongswan: security bump to version
 5.2.2
In-Reply-To: <1420540541-11989-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420540541-11989-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150106214925.49e64a51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  6 Jan 2015 07:35:40 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-9221 - denial-of-service vulnerability triggered by an
> IKEv2 Key Exchange payload that contains the Diffie-Hellman group 1025.
> 
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/strongswan/Config.in       | 16 ++++++++++++----
>  package/strongswan/strongswan.hash |  2 ++
>  package/strongswan/strongswan.mk   |  9 ++++++---
>  3 files changed, 20 insertions(+), 7 deletions(-)
>  create mode 100644 package/strongswan/strongswan.hash

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
