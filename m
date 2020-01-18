From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 23:35:59 +0100
Subject: [Buildroot] [PATCH v8 19/20] package/kodi-visualisation-*: mass
 version bump
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-20-bernd.kuhls@t-online.de>
 <20200118220358.GI32369@scaer>
Message-ID: <frdcfgxnh9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 18 Jan 2020 23:03:58 +0100 schrieb Yann E. MORIN:

> Bernd, All,
> 
> On 2020-01-18 21:06 +0100, Bernd Kuhls spake thusly:
>> Rebased
>> package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-
for-egl-with-pkg-config.patch
> 
> You said "rebased" but you removed it altogether. It has however never
> been upstreamed, AFAICS... Care to comment/explai, please?
> 
> Note: if onlt the commit log needes to be fixed, no need to respin the
> series, I can fix locally before applying.

Hi Yann,

you are right, the commit log needs to be rephrased:

Removed patch kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-
for-egl-with-pkg-config.patch because upstream removed glesv2 support:

https://github.com/xbmc/visualization.shadertoy/commit/
d880b98b932efc0c57670ec3f2def947664b60b0

Regards, Bernd
