From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 13:10:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpsl: new package
In-Reply-To: <20210520134959.GB1322222@momiji>
References: <20210519212637.1282972-1-aperez@igalia.com>
 <20210519212637.1282972-2-aperez@igalia.com>
 <999661ba-f9cf-6b66-c442-921595b49176@mind.be>
 <20210520134959.GB1322222@momiji>
Message-ID: <2fbad602-ec9f-bce7-acce-759a4981c3d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/05/2021 12:49, Adrian Perez de Castro wrote:
> As a related note: it is interesting that libpsl can be built against ICU
> because it is possible to have a configuration that needs ICU (as a dependency
> for WPE WebKit, for example) without any other package needing libidn/libidn2.
> So that's neat :)

 libidn2 is so tiny (or rather, ICU is so huge) that it doesn't matter much IMHO.

 Regards,
 Arnout
