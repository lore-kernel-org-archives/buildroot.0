From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2015 20:57:20 +0100
Subject: [Buildroot] [PATCH] cryptodev-linux: bump to version 1.8
In-Reply-To: <20151201174650.358ed096@free-electrons.com>
References: <1448977966-15980-1-git-send-email-gustavo@zacarias.com.ar>
 <20151201174650.358ed096@free-electrons.com>
Message-ID: <565DFBA0.8020704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-12-15 17:46, Thomas Petazzoni wrote:
[snip]
> Applied to next (soon to be master).
> 
> Peter: this might create a conflict when merging back to master. The
> 0002-Fix-compilation-against-linux-4.3.patch that Gustavo is removing
> here has never been added to next, it had only been added to master. So
> when I applied this commit to the next branch, it just discarded the
> information that this commit removes
> 0002-Fix-compilation-against-linux-4.3.patch.
> 
> However, when you merge next into master, please make sure to re-remove
> 0002-Fix-compilation-against-linux-4.3.patch. Otherwise, it will fail
> to apply after extracting the new version of cryptodev-linux.

 Perhaps in the next cycle you should regularly merge master->next to avoid this
kind of issue. You were also bitten by it with unscd so it's not a rare problem.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
