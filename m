From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 20 Jul 2017 07:51:39 +0200
Subject: [Buildroot] [PATCH 2/2] scanpypi: include LICENSE.RST in the
 list of supported license files
In-Reply-To: <20170720052638.32122-2-alexey.roslyakov@gmail.com>
References: <20170720052638.32122-1-alexey.roslyakov@gmail.com>
 <20170720052638.32122-2-alexey.roslyakov@gmail.com>
Message-ID: <CAGm1_ktjBkV9zhyQPMwB0z_vckCjrXyxT1YUPnFaEiQPs9JDEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 20, 2017 at 7:26 AM, Alexey Roslyakov
<alexey.roslyakov@gmail.com> wrote:
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  utils/scanpypi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 9abf3c4139..02384f2569 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -416,8 +416,8 @@ class BuildrootPackage():
>              license=', '.join(licenses))
>          lines.append(license_line)
>
> -        filenames = ['LICENCE', 'LICENSE', 'LICENSE.TXT', 'COPYING',
> -                    'COPYING.TXT']
> +        filenames = ['LICENCE', 'LICENSE', 'LICENSE.RST', 'LICENSE.TXT',
> +                    'COPYING', 'COPYING.TXT']
>          license_files = list(find_file_upper_case(filenames, self.tmp_extract))
>          license_files = [license.replace(self.tmp_extract, '')[1:]
>                           for license in license_files]
> --
> 2.13.0
>
