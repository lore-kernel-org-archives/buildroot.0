From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Dec 2015 22:54:59 +0100
Subject: [Buildroot] [PATCH v7 1/1] package/unscd: new package
In-Reply-To: <1449068177-24100-1-git-send-email-rdkehn@yahoo.com>
References: <1449068177-24100-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <565F68B3.7020309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-12-15 15:56, Doug Kehn wrote:
> A daemon which handles passwd, group and host lookups for running
> programs and caches the results for the next query. This package is
> intended to replace glibc nscd. Presently, glibc nscd is not installed
> by Buildroot.
> 
> unscd depends on glibc because it relies on glibc function
> __nss_disable_nscd.
> 
> nscd.conf is taken from glibc with unused configurations removed.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


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
