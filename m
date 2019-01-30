From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 10:43:56 +0100
Subject: [Buildroot] [PATCH 2/2] leveldb: disable parallel build
In-Reply-To: <20190129193929.27076-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 29 Jan 2019 20:39:29 +0100")
References: <20190129193929.27076-1-fontaine.fabrice@gmail.com>
 <20190129193929.27076-2-fontaine.fabrice@gmail.com>
Message-ID: <875zu61nvn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit abba4e701246f69bc22ca9045e9932abfe9228e9 did not succeed in
 > fixing all parallel build failures because sometimes $(SHARED_OUTDIR) is
 > created but not $(SHARED_OUTDIR)/db so instead of fixing this mess,
 > revert the patch and disable parallel build as upstream switched to
 > cmake

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9c33692aa130a20b0f8e868156e49990e862d6ee

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
