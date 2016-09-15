From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 18:35:42 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
 root filesystem removal
In-Reply-To: <87k2edeay4.fsf@dell.be.48ers.dk>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
Message-ID: <fc0a0de7-398a-8b83-cf76-c4c0b031e01a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 12:04, Peter Korsgaard wrote:
> I'll put out a 2016.08.1 release with this Saturday or Sunday. Anything
> else that should be included in this bugfix release?

 There are still a whole bunch of autobuilder fixes that came in after the
release, but probably most of these are due to -next things.

 Things like
4e9292f package/fbterm: fix download site
3ca860a glibc: fix MIPS and SPARC builds for glibc < 2.24 with recent binutils
could be useful as well.

 But nothing is really screaming that it should be included.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout@mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
