From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 21:51:35 +0100
Subject: [Buildroot] [PATCH 1/1] new package: openldap
In-Reply-To: <1421954334-10021-1-git-send-email-codehero@gmail.com>
References: <1421954334-10021-1-git-send-email-codehero@gmail.com>
Message-ID: <20150125205135.GE3937@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2015-01-22 14:18 -0500, David Bender spake thusly:
> 
> Signed-off-by: David Bender <codehero@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  package/openldap/Config.in                         |   17 +++++
>  .../openldap/openldap-0000-fix_cross_strip.patch   |   67 ++++++++++++++++++++
>  package/openldap/openldap.mk                       |   33 ++++++++++
>  4 files changed, 118 insertions(+), 0 deletions(-)
>  create mode 100644 package/openldap/Config.in
>  create mode 100644 package/openldap/openldap-0000-fix_cross_strip.patch
>  create mode 100644 package/openldap/openldap.mk

I've sent an updated version of that patch:
    http://lists.busybox.net/pipermail/buildroot/2015-January/117984.html

Care to test I haven;t borked it for your use-case?

I removed the --exec-prefix=/ because we usally do not set that, and use
the default, i.e. the same value as --prefix which we set to /usr .
Was there any reason to set --exec-prefix=/ ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
