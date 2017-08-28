From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Aug 2017 22:37:30 +0200
Subject: [Buildroot] [PATCH v2] add package for pdmenu
In-Reply-To: <1503931855-20693-1-git-send-email-brock@cottonwoodcomputer.com>
References: <1503931855-20693-1-git-send-email-brock@cottonwoodcomputer.com>
Message-ID: <40b2b120-b61b-4169-82b2-e7a5cd5202b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Brock,

 One small nit...

On 28-08-17 16:50, Brock Williams wrote:
> +PDMENU_SITE = http://http.debian.net/debian/pool/main/p/pdmenu

 Debian archive URLs are not stable - when the package is updated in debian and
it is no longer referred to by any Sources file, it is removed from the archive.

 Therefore, we always use snapshot.debian.org URLs. They are guaranteed to exist
in all eternity.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
