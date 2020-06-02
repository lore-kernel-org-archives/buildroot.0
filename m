From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 08:12:36 +0200
Subject: [Buildroot] [PATCHv2] package/fmc+fmlib: change repository
 location
In-Reply-To: <20200527154734.11381-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 27 May 2020 17:47:34 +0200")
References: <20200527154734.11381-1-yann.morin.1998@free.fr>
Message-ID: <87tuzudmi3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Now that Freescale has been wholly swallowed into NXP, the public-facing
 > git repositories that were hosting those two packages are no longer
 > available.

 > Fortunately, they had been mirrored on Code Aurora forge (a Linux
 > Foundation project, so relatively stable and trustworthy), which has the
 > tags we need, and that generates the exact same archives.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

 > ---
 > Changes v1 -> v2:
 >   - use CodeAurora's git tree, rather than archives on s.b.o.  (Matt)

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
