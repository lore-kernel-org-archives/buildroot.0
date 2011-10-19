From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Oct 2011 10:12:39 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <201110182339.00295.arnout@mind.be>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018192708.68b1ba88@skate>
 <bd3650393bb885ae632b4e1963278d3f@zacarias.com.ar>
 <201110182339.00295.arnout@mind.be>
Message-ID: <1319011959.325.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2011-10-18 at 23:38 +0200, Arnout Vandecappelle wrote:

> > In a non-mandatory way it may be desirable.
> > That is if a package doesn't define it then we don't care.
> > Most of the time tarballs shouldn't change size & hash, though it 
> > doesn't hold true for every project around.
> 
>  Size and hash should only change when you bump the version

Unfortunately it is not so uncommon for some projects to re-release with
the same version number if a bug sneaked into the released tarball. I
know that this should not be the case, but it happens every so often.

Not sure though what implications this has for the proposed buildroot
changes...


Regards,
Sven
