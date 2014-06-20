From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Jun 2014 23:12:27 +0200
Subject: [Buildroot] [PATCH 5/5] gst-fsl-plugins: bump to version 3.0.11
In-Reply-To: <1403150639-29382-6-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403150639-29382-6-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140620211227.GC26745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-06-18 21:03 -0700, Gary Bisson spake thusly:
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
>  ...gins-0002-Fix-bashism-in-configure-script.patch |  25 +-
>  .../gst-fsl-plugins-0003-Use-proper-objdump.patch  |   6 +-
>  ...sl-linkage-add-lrt-for-shared-memory-func.patch |   2 +-
>  ...-plugins-0005-build-Fix-out-of-tree-build.patch | 616 +++++++++++++++++++++

In Buildroot, we're not doing out-of-tree builds of packages, so we do
not need the 0005 patch. Since it is a biggish piece, it's better to
leave it out.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
