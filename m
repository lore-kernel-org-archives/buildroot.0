From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Mar 2017 13:37:11 +0100
Subject: [Buildroot] [PATCH 3/3] gitlab-ci: add gcc-multilib to the
 docker image
In-Reply-To: <20170310123558.22033-3-arnout@mind.be>
References: <20170310123558.22033-1-arnout@mind.be>
 <20170310123558.22033-3-arnout@mind.be>
Message-ID: <ababc3f3-7361-5c87-627b-3c94047664b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-03-17 13:35, Arnout Vandecappelle (Essensium/Mind) wrote:
> This is needed for defconfigs that use sylinux.
 D'oh!                                   ^^^^^^^syslinux, obviously.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
