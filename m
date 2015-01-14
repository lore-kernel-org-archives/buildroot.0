From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 14 Jan 2015 22:15:02 +0100
Subject: [Buildroot] Using a local kernel tarball?
In-Reply-To: <20150113131925.58ca1219@black>
References: <20150113131925.58ca1219@black>
Message-ID: <18C83A04-432F-4D73-ADAC-ED64715C267E@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bill,

On January 13, 2015 8:19:25 PM CET, Bill Borton <security@conwin.com> wrote:
>Hi guys,
>
>It would appear I can use a local directory, repository or a custom
>tarball URL... but not a local tarball?
>
>If my kernel src is in say
>buildroot/boards/company/product/kernel.tar.bz how do I tell Buildroot
>to use it?
>
>I'm betting I've missed something obvious...

Use file:// as URL prefix to point to a local file...

Best regards,
Thomas
