From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 May 2017 18:38:59 +0200
Subject: [Buildroot] [PATCH 1/1] erlang: bump version to 19.3
References: <1494508887-7015-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <3mgeudxoso.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 11 May 2017 09:21:27 -0400 schrieb Frank Hunleth:

> This change bumps the Erlang version from 18.3 to 19.3. Erlang 19.0 has
> many improvements but introduces a few incompatible changes to Erlang
> 18.3. Details are at:

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Run-time tested on uClibc at x86_64 with couchdb[1] scraping Wikipedia.

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/645223/
