From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:56:14 +0200
Subject: [Buildroot] [PATCH 01/11] cryptopp: use $(HOST_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20161029155614.2b17608a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 10:18:19 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/cryptopp/cryptopp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I've applied all 11 patches, but did a few changes on some of them,
I'll answer to those patches separately.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
