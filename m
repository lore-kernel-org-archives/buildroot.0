From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:36:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: fix nios2 detection
In-Reply-To: <1428005152-32735-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428005152-32735-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150403153657.217fb17d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  2 Apr 2015 22:05:52 +0200, Bernd Kuhls wrote:

> + case $host in
> +-  *os2*)
> ++  *os_2*)

I've changed this to *-os2*, which matches what is done in
autoconf config.guess. It makes sure it will continue to match OS/2,
but not NIOS 2.

Applied with this changed. Feel free to submit the patch upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
