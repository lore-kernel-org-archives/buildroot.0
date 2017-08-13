From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Aug 2017 18:02:51 +0200
Subject: [Buildroot] [PATCH 3/3] package/sysdig: bump to version 0.17.0
In-Reply-To: <1502467249-2861-4-git-send-email-angelo.compagnucci@gmail.com>
References: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
 <1502467249-2861-4-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <834e0ac9-0ba8-3035-3ecb-dfe5dbafced3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 18:00, Angelo Compagnucci wrote:
> This patch bumps sysdig to version 0.17.0 and updates the
> dependencies accordingly.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

 Applied to next, thanks.

 I also changed it to depend on GCC 4.8 because that's what upstream claims they
support - I haven't actually tested with GCC 4.7.

 Note that this package doesn't get tested in the autobuilders since it depends
on the kernel. We really should find a solution for that...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
