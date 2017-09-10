From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Sep 2017 16:49:26 +0200
Subject: [Buildroot] [PATCHv2 1/1] openjpeg: Fix malloc poison issue
References: <20170908075217.4900-1-olivier.schonken@gmail.com>
Message-ID: <m00g8ex5cg.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 08 Sep 2017 09:52:17 +0200 schrieb Olivier Schonken:

> The malloc poison issue has been fixed upstream, this patch will thus
> only be temporary.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ build-tested using http://autobuild.buildroot.net/
results/856/8561fc22d023bc109c3c3960bbb3578084bc3a7e/ ]
