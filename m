From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 02:30:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-04
In-Reply-To: <df36574f-bff9-b295-2a82-825a13894f58@gmail.com>
References: <20161105073056.4969320D86@mail.free-electrons.com>
 <df36574f-bff9-b295-2a82-825a13894f58@gmail.com>
Message-ID: <df69f5f2-2881-d4b9-759a-3c2f4bcf7192@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-16 23:03, Romain Naour wrote:
> You can reproduce the issue easily by adding LC_ALL=C to TVHEADEND_BUILD_CMDS.
> Can we force the utf8 encoding ?

 Maybe we should export LC_ALL=C.UTF-8 instead of LC_ALL=C ? That might have
some unexpected side effect, but I don't really expect it.

 If we want to be on the safe side, we can just do that bit in
TVHEADEND_BUILD_CMDS to override the global locale.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
