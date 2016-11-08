From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 13:30:16 +0100
Subject: [Buildroot] [PATCH v4 04/22] toolchain-external: introduce
 toolchain-external-package
In-Reply-To: <20161108092049.45aa1609@free-electrons.com>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-5-arnout@mind.be>
 <a6555b0b-413d-0248-8b6f-75319c385440@gmail.com>
 <96c92e87-dc71-3030-d620-5ed285259ebb@mind.be>
 <20161108092049.45aa1609@free-electrons.com>
Message-ID: <9b5894c1-e895-1bab-ea4d-da880ee0323f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 09:20, Thomas Petazzoni wrote:
> Should we instead try to have some ancient ARM toolchain, in order to
> keep testing old gcc, old binutils, etc. ? But even the ct-ng
> toolchains that are quite old are causing a number of problems, and
> have autobuilder exceptions.

 That would be useful if such a toolchain uncovers problems that we can fix in
Buildroot. If all it does is to add autobuilder exceptions, there isn't much
point... Well, the other thing we can do is to add *_AT_LEAST_NNN options,
that's true.

 Those autobuilder exceptions for ct-ng, what kind of errors are they for? Not
something covered by *_AT_LEAST? Like bugs in libc, for which we don't have
_AT_LEAST?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
