From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:23:32 +0200
Subject: [Buildroot] [PATCH v1] bind: fix configure in case lmdb devel
 files are present on the host
In-Reply-To: <20170808165758.14788-1-ps.report@gmx.net>
References: <20170808165758.14788-1-ps.report@gmx.net>
Message-ID: <0e6b9279-5a4c-5f32-9110-2c0d0fa00e04@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-17 18:57, Peter Seiderer wrote:
> Fix configure failure in case lmdb devel files are present on the host
> by adding --without-lmdb option (reported [1] and fix tested [2],[3] by
> grunpferd at netscape.net).
> 
> Fixes:
> 
>   checking for lmdb library... yes
>   checking for library containing mdb_env_create... no
>   configure: error: found lmdb include but not library.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-August/199945.html
> [2] http://lists.busybox.net/pipermail/buildroot/2017-August/199963.html
> [3] http://lists.busybox.net/pipermail/buildroot/2017-August/199964.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
