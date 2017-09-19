From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 20:36:43 +0200
Subject: [Buildroot] [PATCH] package/zstd: Install tools into /usr/bin,
 not /usr/local/bin
References: <20170916002712.19851-1-andrew.smirnov@gmail.com>
Message-ID: <rm489ex2tm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 15 Sep 2017 17:27:12 -0700 schrieb Andrey Smirnov:

> Install tools into /usr/bin, not /usr/local/bin, since /usr/local/bin is
> not in PATH by deafault.
> 
> Signed-off-by: Andrey Smirnov
> <andrew.smirnov@gmail.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
