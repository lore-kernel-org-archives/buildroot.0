From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 20:13:19 +0200
Subject: [Buildroot] [PATCH v4 1/7] docs/manual: Fix trivial typo
In-Reply-To: <20150714171720.5e057e07@pcviktorin.fit.vutbr.cz>
References: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
 <20150714171720.5e057e07@pcviktorin.fit.vutbr.cz>
Message-ID: <CAGduivyomyHGUC8hRvHZiRyj1p65isQKAsQRE1vquY-qyn4+8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

On Tue, Jul 14, 2015 at 5:17 PM, Jan Viktorin <viktorin@rehivetech.com> wrote:
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  docs/manual/adding-packages-python.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index f81d625..588dbf8 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -143,7 +143,7 @@ therefore only use a few of them, or none.
>  * +HOST_PYTHON_FOO_NEEDS_HOST_PYTHON+, to define the host python
>    interpreter. The usage of this variable is limited to host
>    packages. The two supported value are +python2+ and +python3+. It
> -  will ensures the right host python package is available and will
> +  will ensure the right host python package is available and will
>    invoke it for the build. If some build steps are overloaded, the
>    right python interpreter must be explicitly called in the commands.
>
> --
> 2.4.5
>
>
>
>
> --
>    Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
>    System Architect              Web:    www.RehiveTech.com
>    RehiveTech                    Phone:  +420 606 201 868
>    Brno, Czech Republic
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
