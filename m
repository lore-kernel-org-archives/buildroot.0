From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 18:04:47 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: remove old patch for uClibc
In-Reply-To: <20171104160125.17383-1-romain.naour@gmail.com>
References: <20171104160125.17383-1-romain.naour@gmail.com>
Message-ID: <fa7c2322-0f69-0896-a2e8-35ed4174e553@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-11-17 17:01, Romain Naour wrote:
> This patch is no longer necessary since Buildroot is using uClibc-ng
> and the patch [1] as been merged upstream.
> It's 2017 and uClibc toolchains have been rebuild with uClibc-ng.
> 
> Drop upstream patch and rename remaining one.
> 
> [1] https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/commit/?id=6c4538905e65ceb203f59aaa9a61728e81c6bc0a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

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
