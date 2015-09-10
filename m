From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Sep 2015 15:23:50 +0200
Subject: [Buildroot] [PATCHv4] gdb: prevent building the documentation
In-Reply-To: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441875400-16473-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55F18466.8080603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-09-15 10:56, Vicente Olivert Riera wrote:
> Force gdb to not build the documentation. This way we avoid depending on
> host-texinfo. This is a temporary fix until upstream accepts a proposed
> --disable-docs configure option.
> 
> Since the documentation will not be build at all, we can remove the
> parts related to host-texinfo and MAKEINFO in the gdb.mk file.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Brendan Heading <brendanheading@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
