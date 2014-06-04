From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Jun 2014 08:52:37 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.10
In-Reply-To: <1401833214-31074-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401833214-31074-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140604085237.2de9d1f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Jun 2014 19:06:54 -0300, Gustavo Zacarias wrote:
> Drop --disable-tls since it's not needed.
> 
> Add --disable-rpath to avoid unnecessary pollution.
> 
> e4defrag now needs an (e)glibc toolchain because of sync_file_range()

Or musl, but I see that you implement the dependency as 'depends
on !uclibc', so it's fine. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
