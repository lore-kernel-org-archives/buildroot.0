From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:44:25 +0200
Subject: [Buildroot] [PATCH] package/qt5location: isolate patch to qt
 5.9.1
In-Reply-To: <1501278799-22827-1-git-send-email-joshua.henderson@microchip.com>
References: <1501278799-22827-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <10be2393-0325-def3-479c-ff62a4deacca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-07-17 23:53, Joshua Henderson wrote:
> Fixes a build issue [1] where the qt5location upstream patch should only be
> applied to 5.9.1.  This moves the patch into the appropriate directory.
> 
> [1] http://autobuild.buildroot.net/results/676abe008c9c4bddfddd7b041d8db9999e9e899d
> 
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

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
