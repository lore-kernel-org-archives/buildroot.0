From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 22:04:55 +0100
Subject: [Buildroot] [PATCH] package/openldap: new package
In-Reply-To: <1422212946-14460-1-git-send-email-yann.morin.1998@free.fr>
References: <1422212946-14460-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150125210455.GH3937@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2015-01-25 20:09 +0100, Yann E. MORIN spake thusly:
> From: David Bender <codehero@gmail.com>
> 
> Signed-off-by: David Bender <codehero@gmail.com>
> [yann.morin.1998 at free.fr:
>   - remove ldaps config option, use build-time dependencies
>   - add dependencies against openssl/gnutls/libnss as appropriate
>   - fix mis-detected tls support when openssl is enabled
>   - fix strip at install time
>   - cleanup configure arguments
>   - fix help entry
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/Config.in                           |  1 +
>  package/openldap/0001-fix_cross_strip.patch | 74 +++++++++++++++++++++++++++++
>  package/openldap/0002-fix-bignum.patch      | 38 +++++++++++++++
>  package/openldap/Config.in                  |  9 ++++
>  package/openldap/openldap.mk                | 58 ++++++++++++++++++++++
>  5 files changed, 180 insertions(+)
>  create mode 100644 package/openldap/0001-fix_cross_strip.patch
>  create mode 100644 package/openldap/0002-fix-bignum.patch
>  create mode 100644 package/openldap/Config.in
>  create mode 100644 package/openldap/openldap.mk

Damn, I forgot to git add the hash file...
I'll resubmit a bit later, to let people have a look at it anyway...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
