From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 15:10:44 +0100
Subject: [Buildroot] [PATCH] ecryptfs-utils: add linux-pam dependency if
 PAM has been enabled
In-Reply-To: <CAJPHfYOm0O9WSRv-u1huwqzeEKBsKEEpsqTjd3ugJ=NwiwwSUw@mail.gmail.com>
References: <20191127042053.GC1282@techyauld.com>
 <CAJPHfYOm0O9WSRv-u1huwqzeEKBsKEEpsqTjd3ugJ=NwiwwSUw@mail.gmail.com>
Message-ID: <20191224151044.65b367bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Nov 2019 12:23:48 +0800
Yi Zheng <goodmenzy@gmail.com> wrote:

>         If linux-pam has been selected, we want to build pam_ecryptfs.so
>         and install it into /lib/security/
> 
> Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
> ---
>  package/ecryptfs-utils/ecryptfs-utils.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
