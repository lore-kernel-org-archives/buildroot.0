From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:34:06 +0200
Subject: [Buildroot] Mysqld startup problems
In-Reply-To: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
References: <CAJJ6jxuKy46_6sk=J9XsRuo8JXnBgyFk1A076cie+C5p=uDwPw@mail.gmail.com>
Message-ID: <c470d254-7038-3d46-d6e6-f541b7519ded@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-17 17:10, Steve Calfee wrote:
> BR2_ROOTFS_DEVICE_TABLE="$(BR2_EXTERNAL)/seagatedockstar/device_table.txt"

 By the way, this isn't the way you should specify it any more, you should use
BR2_EXTERNAL_<NAME>_PATH instead.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
