From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:29:14 +0200
Subject: [Buildroot] [PATCH 1/2] pcre2: new package, required by Qt 5.9
In-Reply-To: <DM5PR03MB2924501FB63A9FEA79548F57BFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
References: <DM5PR03MB2924501FB63A9FEA79548F57BFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
Message-ID: <20170709182914.2613e5f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 03:45:16 +0000, Brent Sink wrote:
> This patch has been provided by Naoki Matsumoto
> https://patchwork.ozlabs.org/patch/781474/
> 
> Signed-off-by: Brent Sink <brents_3@hotmail.com>
> Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
> ---
>  package/Config.in                                  |  1 +
>  package/pcre2/Config.in                            | 22 ++++++++++++++++++++++
>  package/pcre2/pcre2.hash                           |  2 ++
>  package/pcre2/pcre2.mk                             | 20 ++++++++++++++++++++
>  4 files changed, 45 insertions(+)
>  create mode 100644 package/pcre2/Config.in
>  create mode 100644 package/pcre2/pcre2.hash
>  create mode 100644 package/pcre2/pcre2.mk

I've applied, after doing the following changes:

    [Thomas:
     - reassign authorship to Naoki Matsumoto
     - add entry to DEVELOPERS file
     - fix broken patch
     - add comment about where the PGP signature was coming from]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
