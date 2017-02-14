From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 20:55:16 +0100
Subject: [Buildroot] [PATCHv4] package/ccache: do not force colored
	diagnostics
In-Reply-To: <1487093072-4270-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 14 Feb 2017 18:24:32 +0100")
References: <1487093072-4270-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87mvdoim3f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
 > this flag requires GCC v4.9 or later. Older versions complain about the
 > unrecognized command line option.

 > Using GCC_COLORS in the context of Buildroot is seldom useful, so we
 > just unexport GCC_COLORS altogether.

 > Reported-by: Carlos Santos <casantos@datacom.ind.br>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
