From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Oct 2016 20:09:55 +0200
Subject: [Buildroot] cached downloads for scm branches
In-Reply-To: <D2934D97-E0A4-4AE5-933C-49D38BFFB436@walle.cc>
References: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
 <20161020213841.75105d07@free-electrons.com>
 <D2934D97-E0A4-4AE5-933C-49D38BFFB436@walle.cc>
Message-ID: <df0e1d12-0919-2bf8-3d52-add41effabae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-10-16 22:29, Michael Walle wrote:
> thanks. yeah i thought so. Just to give you some background regarding my
> question. We have some kind of CI, actually it's rather a daily build. we build
> a root filesystem with some fixed packages, but also with multiple packages of
> our own and we want to track the tip of a branch for a build (because it is CI
> ;)). I don't think the src override method really suit the CI case. I guess one
> way could be that the CI defines the commit that should be build. Or simply
> delete the download. mhh ;)

 Actually, the src override method fits the CI case perfectly because CI can
watch the repositories to be overridden and check them out.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
