From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Feb 2015 11:10:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-22
In-Reply-To: <20150223073016.4059D1027D4@stock.ovh.net>
References: <20150223073016.4059D1027D4@stock.ovh.net>
Message-ID: <54EAFCAA.5070506@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 23/02/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-02-22
> ===============================
> 
>     mips64el |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/211d403c601ff73bd84b43881fb59fd7ee46389b/

I can't reproduce this, but I think it could be caused by a parallel
build issue. The same happened in mesa:

https://bugs.freedesktop.org/show_bug.cgi?id=83355

Regards,
--
Vincent
