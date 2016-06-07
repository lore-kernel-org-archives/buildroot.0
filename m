From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:13:54 +0200
Subject: [Buildroot] [PATCH] fs: add sha-bang to fakeroot script
In-Reply-To: <1465330181-4010-1-git-send-email-yann.morin.1998@free.fr>
References: <1465330181-4010-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160607231354.0f476b43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 22:09:41 +0200, Yann E. MORIN wrote:
> We directly running this script, so it should start with a sha-bang (not
> sure why/how it works today...).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/common.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
