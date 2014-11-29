From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 29 Nov 2014 14:20:50 +0100
Subject: [Buildroot] [PATCHv4 4/4] start-stop-daemon: new package
In-Reply-To: <1417107630-14909-5-git-send-email-gustavo@zacarias.com.ar>
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CABbD_XB5EH92r=0K6pjWuAOMSRdK5B4f_wro=XxbeJS=_LHEHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Nov 27, 2014 at 6:00 PM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> We don't use the 1.17.x series because it has issues when
> cross-compiling.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Config.in                                  |  3 ++
>  .../0001-add-uclibc-alias-and-musl.patch           | 42
> ++++++++++++++++++++++
>  package/start-stop-daemon/Config.in                |  8 +++++
>  package/start-stop-daemon/start-stop-daemon.hash   |  2 ++
>  package/start-stop-daemon/start-stop-daemon.mk     | 36
> +++++++++++++++++++
>  5 files changed, 91 insertions(+)
>  create mode 100644
> package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
>  create mode 100644 package/start-stop-daemon/Config.in
>  create mode 100644 package/start-stop-daemon/start-stop-daemon.hash
>  create mode 100644 package/start-stop-daemon/start-stop-daemon.mk
>
>
Tested-by: Karoly Kasza <kaszak@gmail.com>
Reviewed-by: Karoly Kasza <kaszak@gmail.com>

Tested with next branch, x86_64 arch in QEMU and VMW, internal toolchain
GCC 4.9.2, Linux 3.17.x, SysV init and a lot of utilities, like OpenSSH.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141129/544be6d8/attachment.html>
