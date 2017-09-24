From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:27:45 +0200
Subject: [Buildroot] [PATCH 1/9] luaposix: bump to version 34.0.1
In-Reply-To: <CAB0FRstCXqwkhSqB3HeQ8okPDos1hFO7KJ13Zz=izO=L=kbtYw@mail.gmail.com>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
 <332fbe7b-3daf-16ad-cd78-9efb049f34ba@mind.be>
 <CAB0FRstCXqwkhSqB3HeQ8okPDos1hFO7KJ13Zz=izO=L=kbtYw@mail.gmail.com>
Message-ID: <a435ae6a-7af8-b52d-8ea6-da6fad425e80@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 16:03, Fran?ois Perrad wrote:
> 
> luaposix have a rockspec, but not suitable for BR.
> Because our luarocks infrastructure handles only the type=builtin which
> represents almost 90% of all rockspec.
 OK. Would have been nice to mention this in the commit message.

 I pushed the rest of the series, with still a few things I had to fix up:

- In lua-libcurl, there was a space missing after the = in one of the assignments.
- In lua-valua and lua-sailor, the help text was not wrapped at 72 columns.
check-package caught this.
- In lua-markdown, the .mk and .hash file were called lua-mardown (missing a k).
check-package caught this as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
