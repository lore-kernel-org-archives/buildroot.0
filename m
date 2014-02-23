From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:29:57 +0100
Subject: [Buildroot] [PATCH 04/13] docs/manual: reference Python and Lua
 infras from the list of package infrastructures
In-Reply-To: <1393167879-16637-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223152957.GF3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> ---
>  docs/manual/adding-packages-directory.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 754a145..eff92fa 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -323,5 +323,16 @@ different way, using different infrastructures:
>     CMake. We cover them through a xref:cmake-package-tutorial[tutorial]
>     and xref:cmake-package-reference[reference].
>  
> +* *Makefiles for Python modules*: We have a dedicated infrastructure
> +   for Python modules that use either the +distutils+ or the
> +   +setuptools+ mechanism. We cover them through a
> +   xref:python-package-tutorial[tutorial] and
> +   xref:python-package-reference[reference].

I believe english grammar mandates the following:
    [...] a tutorial and a reference.

So, you're missing an 'a' between the 'and' and the 'reference'.

Also, what about the mandatory status of this? For other package
onfrastructures, we say:
    This infrastructure must be used for new packages that rely on [XXX]
    as their build system.

Why don't we add this for Python modules?

> +* *Makefiles for Lua modules*: We have a dedicated infrastructure for
> +   Lua modules available through the LuaRocks web site. We cover them
> +   through a xref:luarocks-package-tutorial[tutorial] and
> +   xref:luarocks-package-reference[reference].

Ditto 'a' and ditto 'mandatory'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
