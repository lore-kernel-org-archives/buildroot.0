From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 19:56:08 +0100
Subject: [Buildroot] [PATCH 1/3] microperl: remove it
In-Reply-To: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
References: <1362220740-17593-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130303195608.6d85ef7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  2 Mar 2013 11:38:58 +0100, Francois Perrad wrote:
> microperl has been deprecated by perl
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  docs/manual/deprecated-list.txt                    |    1 -
>  package/Config.in                                  |    1 -
>  package/libxml-parser-perl/libxml-parser-perl.mk   |    6 -
>  package/microperl/Config.in                        |   30 ----
>  .../microperl/microperl-no-signal-handlers.patch   |   22 ---
>  package/microperl/microperl-uudmap.patch           |   47 ------
>  package/microperl/microperl.mk                     |  156 --------------------
>  7 files changed, 263 deletions(-)
>  delete mode 100644 package/microperl/Config.in
>  delete mode 100644 package/microperl/microperl-no-signal-handlers.patch
>  delete mode 100644 package/microperl/microperl-uudmap.patch
>  delete mode 100644 package/microperl/microperl.mk

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I think docs/manual/deprecated-list.txt is automatically generated, so
it probably shouldn't be changed, but I guess Peter can fix that when
committing.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
