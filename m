From: =?windows-1252?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 01 Mar 2015 15:35:54 +0100
Subject: [Buildroot] [git commit branch/next] wine: New package
In-Reply-To: <54F310E4.2090805@imgtec.com>
References: <20150301120824.DC26D803FB@busybox.osuosl.org>
 <54F310E4.2090805@imgtec.com>
Message-ID: <54F323CA.6020208@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 01.03.2015 um 14:15 schrieb Vicente Olivert Riera:
> Hello,
> 
> maybe I have missed it in the mailing list, but..., why not enable this
> package also for x86_64 targets?

Hi,

because Wine is only really useful on x86_64 when it is built as a WoW64 Setup (compile a 32-bit Wine and a 64-bit Wine)
Thus you need to build a x86 32-bit Wine while targeting x86_64, AFAIK buildroot doesn't work this way.
When buildroot is able to produce a multilib/multiarch systems, i guess then it's possible to build Wine that way...
