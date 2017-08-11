From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 12:00:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: bump to version 5.0.1.1
In-Reply-To: <1502439245-18039-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
 <1502439245-18039-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <7dc157e1-bde7-5143-be61-aaee3c309bcb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 10:14, Angelo Compagnucci wrote:
> This patch bumps to mono 5.0.1.1 and updates the unit tests patch
> accordingly.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  .../0006-Remove-unit-tests-from-mono-compilation.patch     | 14 +++++++-------

 What is the upstream status of all the patches? Most of the other patches look
like they could be applicable for upstream, can you send them?

 Also, patch 4 says:

Patch is upstream:

   https://github.com/mono/mono/commit/40c171799b671718969ee28a02f92884d7fd181e

so why is this one not removed? Could you mention that explicitly in the commit log?


 It would also be nice to rewrite patch 6 and 8 so they are upstreamable, but I
can imagine that that's more complicated.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
