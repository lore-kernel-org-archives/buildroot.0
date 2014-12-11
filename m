From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 21:38:26 +0100
Subject: [Buildroot] [PATCH 2/4 v4] pkg-download: check for already
 downloaded file in the download wrapper
In-Reply-To: <09c8290b9f3c9bb15d9fd72617d0aeeb9cd861e4.1418322200.git.yann.morin.1998@free.fr>
References: <cover.1418322200.git.yann.morin.1998@free.fr>
 <09c8290b9f3c9bb15d9fd72617d0aeeb9cd861e4.1418322200.git.yann.morin.1998@free.fr>
Message-ID: <20141211213826.0681d0ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 19:24:46 +0100, Yann E. MORIN wrote:
> Instead of repeating the same test again and again in all our download
> rules, just delegate the check for an already downloaded file to the
> download wrapper.
> 
> This clears up the path for doing the hash checks on a cached file
> before the download.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
