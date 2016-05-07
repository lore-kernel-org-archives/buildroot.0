From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 22:55:35 +0200
Subject: [Buildroot] Reproducible builds
In-Reply-To: <20160507151117.33428d9f@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <20160507151117.33428d9f@free-electrons.com>
Message-ID: <2b0081e4-61c0-ef40-3830-215982a984ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 15:11, Thomas Petazzoni wrote:
> Finally, I'm also concerned by the testability of the reproducible
> build feature. To make sure such a feature work, we would need to do
> some automated build testing of the same configuration in various
> environments/configurations and ensure they provide the same output.
> This is clearly not impossible to do, but there's quite some work
> involved to set up such an infrastructure.

  Even if it is not regularly tested, I think we can start including this 
feature. But the help text should clarify that there are no guarantees.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
