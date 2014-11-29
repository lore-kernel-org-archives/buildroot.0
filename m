From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 29 Nov 2014 14:20:46 +0100
Subject: [Buildroot] [PATCHv4 3/4] ifupdown: new package
In-Reply-To: <1417107630-14909-4-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CABbD_XC84BFj8BpfNVhdT6p5EJjvmrArY5hRq5sKuCwCZy5OCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Nov 27, 2014 at 6:00 PM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  3 +++
>  .../ifupdown/0001-dont-use-dpkg-architecture.patch | 17 ++++++++++++++
>  package/ifupdown/Config.in                         | 17 ++++++++++++++
>  package/ifupdown/ifupdown.hash                     |  2 ++
>  package/ifupdown/ifupdown.mk                       | 26
> ++++++++++++++++++++++
>  5 files changed, 65 insertions(+)
>  create mode 100644 package/ifupdown/0001-dont-use-dpkg-architecture.patch
>  create mode 100644 package/ifupdown/Config.in
>  create mode 100644 package/ifupdown/ifupdown.hash
>  create mode 100644 package/ifupdown/ifupdown.mk
>

Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested with next branch, x86_64 arch in QEMU and VMW, internal toolchain
GCC 4.9.2, Linux 3.17.x, SysV init and a lot of utilities, like OpenSSH.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141129/b420b3c1/attachment.html>
