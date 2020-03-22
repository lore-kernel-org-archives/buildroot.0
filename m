From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 08:32:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/perl: fix README hash
In-Reply-To: <20200321201623.287087-1-fontaine.fabrice@gmail.com>
References: <20200321201623.287087-1-fontaine.fabrice@gmail.com>
Message-ID: <20200322073246.GQ4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-21 21:16 +0100, Fabrice Fontaine spake thusly:
> Commit d5c7c9dabb94d64855b8c0383e77d01b890f85c3 forgot to update README
> hash (year, github issue tracker):
> https://github.com/Perl/perl5/commit/9802995490251df92faf7a0dd5c7114ad8146bd3
> https://github.com/Perl/perl5/commit/b9e2183386fadc0979b46e024365ceab56a369aa
> 
> Also update indentation (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3b124aca123207460a9d025f5afd23f5f67fbf18
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/perl/perl.hash | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index 74791c0b05..7c153fedb2 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,12 +1,12 @@
>  # Hashes from: http://www.cpan.org/src/5.0/perl-5.30.2.tar.xz.{md5,sha1,sha256}.txt
> -md5    4bfa12b528522a50de0470b8b70b9b3b                                 perl-5.30.2.tar.xz
> -sha1   d82cdaa610a3e749e821fc77004b1b4bfd5ebd28                         perl-5.30.2.tar.xz
> -sha256 a1aa88bd6fbbdc2e82938afbb76c408b0ea847317737b712dc196cc7907a5259 perl-5.30.2.tar.xz
> +md5  4bfa12b528522a50de0470b8b70b9b3b  perl-5.30.2.tar.xz
> +sha1  d82cdaa610a3e749e821fc77004b1b4bfd5ebd28  perl-5.30.2.tar.xz
> +sha256  a1aa88bd6fbbdc2e82938afbb76c408b0ea847317737b712dc196cc7907a5259  perl-5.30.2.tar.xz
>  
>  # Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.2/perl-cross-1.3.2.hash
> -sha256	defa12f0ad7be0b6c48b4f76e2fb5b37c1b37fbeb6e9ebe938279cd539a0c20c  perl-cross-1.3.2.tar.gz
> +sha256  defa12f0ad7be0b6c48b4f76e2fb5b37c1b37fbeb6e9ebe938279cd539a0c20c  perl-cross-1.3.2.tar.gz
>  
>  # Locally calculated
> -sha256 dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2 Artistic
> -sha256 d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912 Copying
> -sha256 4a39adc445d79e213df5c2028c5432806dfcdfe69a5bc31ba5c83071a0097877 README
> +sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
> +sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
> +sha256  4916e95d32b84e07c045d839646f74996f577e5f497bbba8177a94b31415cee7  README
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
