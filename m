From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:35:14 +0200
Subject: [Buildroot] [PATCH] release: don't include temp files
In-Reply-To: <20200508083220.18927-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 8 May 2020 10:32:20 +0200")
References: <20200508083220.18927-1-yann.morin.1998@free.fr>
Message-ID: <87r1vrshvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we prepare the release, we generate the manual in various formats,
 > so that it can be consulted locally without needing the miriads of tools
 > needed to generate it.

 > However, this creates the temporary .br2-external.* files in the output
 > directory, and those end up in the release tarball.

 > This is not a problem in practice, but is not clean.

 > Run 'distclean' in the output directory, to get rid of everything but
 > the generated documentation.

 > Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
