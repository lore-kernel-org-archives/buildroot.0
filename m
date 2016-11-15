From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2016 22:20:55 +0100
Subject: [Buildroot] [PATCH v2] qt5webkit: Get sources from
 Qt-5-unofficial-builds
In-Reply-To: <99688e1c-048d-1831-b402-e23f48fd6e22@ecagroup.com>
References: <1478699994-22351-1-git-send-email-abrodkin@synopsys.com>
 <99688e1c-048d-1831-b402-e23f48fd6e22@ecagroup.com>
Message-ID: <7ad9c3c6-4739-8b68-400b-97189d630941@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-11-16 15:07, Julien CORJON wrote:
> Alexey,
> 
> I like the idea of fetching obsolete submodules from Qt hosting instead 
> of external github. But, as url say it's snapshot, we will probably have 
> to change hash file more often... Maybe we will have to get rid of hash 
> files for theses obsolete submodules.

 Since the tarballs are actual versioned tarballs, I do hope that they don't
just change randomly...

 However, there is a risk that the tarballs just disappear after some time. But
we have sources.buildroot.org for that.

 Regards,
 Arnout

> 
> Still I'm much more for this solution so :
> Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
