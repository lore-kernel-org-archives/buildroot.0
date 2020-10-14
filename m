From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Wed, 14 Oct 2020 13:08:19 +0200
Subject: [Buildroot] [PATCH 0/1] jquery: bump to version 3.5.1
Message-ID: <20201014110819.udxf25qnvs56nmmo@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It seems at least some packaged jQuery plugins are not necessarily
adapted to support jQuery version 3+.  It seems jquery-datetimepicker
may not be compatible, while jquery-sidebar declares no dependency on
any jquery version, but has not been updated for the past five years.

Nevertheless, given the several known vulnerabilities of jQuery
versions <3.5.0, it would be nice to bump it to version 3.5.1 anyway.

Cheers,

Ignacy Gaw?dzki (1):
  jquery: bump to version 3.5.1

 package/jquery/jquery.hash | 2 +-
 package/jquery/jquery.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1
