From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 29 Nov 2014 14:20:41 +0100
Subject: [Buildroot] [PATCHv4 2/4] skeleton/S40network: tweak for debian
	ifupdown
In-Reply-To: <1417107630-14909-3-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CABbD_XDqPegrvugdMnioLx8PuCx=E+56-xFXBuePeqO40s6a9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Nov 27, 2014 at 6:00 PM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> Make the S40network script create the /run/network directory for the
> debian variant of ifupdown which uses it as a lock directory.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  system/skeleton/etc/init.d/S40network | 3 +++
>  1 file changed, 3 insertions(+)
>

Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested with next branch, x86_64 arch in QEMU and VMW, internal toolchain
GCC 4.9.2, Linux 3.17.x, SysV init and a lot of utilities, like OpenSSH.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141129/e45d943e/attachment.html>
