From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Feb 2014 13:00:37 +0100
Subject: [Buildroot] [pkg-perl infra V7 3/6] host-perl-xml-parser:
 rename and refactor with perl infrastructure
In-Reply-To: <1392116205-12810-4-git-send-email-francois.perrad@gadz.org>
References: <1392116205-12810-1-git-send-email-francois.perrad@gadz.org>
 <1392116205-12810-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LVdoasTn=c9ga-QpFsY+HioZwjPqS6zY+ft8oWEysQwKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 11, 2014 at 11:56 AM, Francois Perrad <fperrad@gmail.com> wrote:
> Even though libxml-parser-perl had a Config.in file with an option to
> enable it on the target, this option was hidden by a dependency on
> BR2_HOST_ONLY. So in practice, it was not possible to enable
> libxml-parser-perl on the target. This allows us to rename
> libxml-parser-perl to perl-xml-parser to follow the new naming
> convention of Perl packages, without having to introduce
> Config.in.legacy material.
>
> In addition to this rename, the package is converted to use the newly
> introduced Perl package infrastructure.
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
