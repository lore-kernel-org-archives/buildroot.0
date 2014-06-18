From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Jun 2014 08:52:49 +0200
Subject: [Buildroot] [PATCH] manual: (faq-boot-hang-after-starting) fix
 config entries
In-Reply-To: <1403029723-11397-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1403029723-11397-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <CAAXf6LXm=WG=iaSKzin8bDCKv=3Kr8zsnsR_n5OZEKaagccnFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vivien,

On Tue, Jun 17, 2014 at 8:28 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  docs/manual/faq-troubleshooting.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 2fdb530..1cc113e 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -20,8 +20,8 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
>  then it means that your system is running, but didn't start a shell on
>  the serial console. In order to have the system start a shell on your
>  serial console, you have to go into the Buildroot configuration, +System
> -configuration+, and modify +Port to run a getty (login prompt) on+ and
> -+Baudrate to use+ as appropriate. This will automatically tune the
> +configuration+, and modify +Run a getty (login prompt) after boot+ and
> ++getty options+ as appropriate. This will automatically tune the
>  +/etc/inittab+ file of the generated system so that a shell starts on
>  the correct serial port.

Thanks for your patch.
Maybe the sentence should read:

... System configuration, enable 'Run a getty (login prompt) after
boot', and set the appropriate port and baud rate in the 'getty
options' submenu.

Best regards,
Thomas
