From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 8 Dec 2015 22:02:28 +0100
Subject: [Buildroot] [PATCH 1/2] wine: Make the sane-config patch
 obsolete by using configure flags
In-Reply-To: <20151208094815.7200558c@free-electrons.com>
References: <5665EE7A.1080409@dawncrow.de>
 <20151208094815.7200558c@free-electrons.com>
Message-ID: <56674564.70707@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 08.12.2015 um 09:48 schrieb Thomas Petazzoni:
> Andr?,
> 
> On Mon, 7 Dec 2015 21:39:22 +0100, Andr? Hentschel wrote:
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  package/wine/0003-sane-config-fix.patch | 21 ---------------------
>>  package/wine/wine.mk                    |  3 ++-
>>  2 files changed, 2 insertions(+), 22 deletions(-)
>>  delete mode 100644 package/wine/0003-sane-config-fix.patch
> 
> IMO, this is not the good choice. The patch should be kept and
> submitted upstream. There is absolutely no reason for upstream to
> reject the patch: it simply *adds* the possibility of passing a custom
> sane-config path through SANE_CONFIG, without changing *anything* to
> the existing behavior if SANE_CONFIG is not used.
> 

Hi Thomas,
rebase it, send it to wine-patches at winehq.org (maybe you need to register first, not sure), I'll also sign it off, but I totally doubt it gets in.
One point might be that there's already a way with the variables I used in my patch or that your patch is not generic enough.
