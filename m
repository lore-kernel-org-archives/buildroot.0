From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 20:09:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.48
In-Reply-To: <20210602151034.84953-1-bernd.kuhls@t-online.de>
References: <20210602151034.84953-1-bernd.kuhls@t-online.de>
Message-ID: <81068d63-73bd-7c98-c179-f0b2e6340f04@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/06/2021 17:10, Bernd Kuhls wrote:
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.48
> 
> Fixes CVE-2021-31618:
> mod_http2: Fix a potential NULL pointer dereference [Ivan Zhakov]
> 
> Removed patch 0004 which is included in upstream release.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout
