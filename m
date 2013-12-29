From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Dec 2013 22:58:15 +0100
Subject: [Buildroot] [PATCH 4/4] graphs: support generating png graphs
In-Reply-To: <20131228165051.5a8ed1e2@skate> (Thomas Petazzoni's message of
 "Sat, 28 Dec 2013 16:50:51 +0100")
References: <cover.1388185918.git.yann.morin.1998@free.fr>
 <22105197db33dde1f1cee82511ce9c6d00d86853.1388185918.git.yann.morin.1998@free.fr>
 <20131228165051.5a8ed1e2@skate>
Message-ID: <87k3enpbew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Yann E. MORIN,
 > On Sat, 28 Dec 2013 00:12:52 +0100, Yann E. MORIN wrote:

 >> @echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 >> @echo '  make O=dir             - Locate all output files in "dir", including .config'
 >> @echo '  make GRAPH_ALT=1       - use alternate color-scheme for build-time graphs'
 >> +	@echo '  make GRAPH_OUT=pdf|png - generate either pdf (default) or png graphs'

 > I'm a little bit concerned about these variables. They are specific to
 > the graph-build-time thing, but still they clutter the 'make help'
 > output, just for some very special functionality.

 > Since it's quite specific, shouldn't we just document them in the
 > manual instead, and keep only the graph-build target in make help?

Yes, I also think the manual is a better place for this.

-- 
Bye, Peter Korsgaard
