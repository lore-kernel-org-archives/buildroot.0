From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jun 2017 18:29:07 +0200
Subject: [Buildroot] [PATCH v2] glibc: remove version choice
In-Reply-To: <20170610205337.GA15034@waldemar-brodkorb.de>
References: <20170610205337.GA15034@waldemar-brodkorb.de>
Message-ID: <dd405fd5-1c22-8d69-1d61-d33393ca7468@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-06-17 22:53, Waldemar Brodkorb wrote:
> We do not support uClibc-ng/musl C library version choice support,
> do the same for GNU C Library.
> Add me as Maintainer for the package.
> No legacy handling required as only version choice is removed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Perhaps we could also remove BR2_GLIBC_VERSION_2_22 from Config.in.legacy, but
that will happen automaticaly when it is cleaned up.

 Note that due to lousy internet connectivity I didn't actually test the patch.


 Regards,
 Arnout

> ---
> v1 -> v2:
>   - alphabetically order DEVELOPERS entry
>   - add a comment why legacy handling isn't required
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
