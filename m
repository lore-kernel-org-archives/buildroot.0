From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:24:49 +0200
Subject: [Buildroot] [PATCH] flex: add security patch
In-Reply-To: <1470795901-19469-1-git-send-email-gustavo@zacarias.com.ar>
References: <1470795901-19469-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160810142449.1ee45908@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 23:25:01 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-6354 - buffer overflow in generated code (yy_get_next_buffer).
> 
> Patch status: upstream backport.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/flex/0002-fix-CVE-2016-6354.patch | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/flex/0002-fix-CVE-2016-6354.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
