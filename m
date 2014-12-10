From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:25:23 +0100
Subject: [Buildroot] [PATCH] wget: add host-pkgconf dependency
In-Reply-To: <1418172006-18113-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418172006-18113-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141210212523.7329cb30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Dec 2014 21:40:06 -0300, Gustavo Zacarias wrote:
> Uses pkgconfig since 1.16.1+ to find libraries.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wget/wget.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
