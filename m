From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 14:46:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-02
In-Reply-To: <547F12F3.70505@imgtec.com> (Vicente Olivert Riera's message of
 "Wed, 3 Dec 2014 13:41:07 +0000")
References: <20141203073017.2AC17100ADA@stock.ovh.net>
 <547F12F3.70505@imgtec.com>
Message-ID: <87vblsyhgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > On 12/03/2014 07:30 AM, Thomas Petazzoni wrote:
 >> Build statistics for 2014-12-02

 >> mips | xlib_libXau-1.0.8 | NOK |
 >> http://autobuild.buildroot.net/results/b8474b85315a0424870fc655dc89324bb1193d44/

 > I cannot reproduce this even using the same .config file. However I have
 > found that xlibx_libXau also needs to have host-pkgconf on its
 > dependences. Otherwise it would fail with an error like this one:

 > checking for XAU... configure: error: in
 > `/br/output/build/xlib_libXau-1.0.8':
 > configure: error: The pkg-config script could not be found or is too
 > old.  Make sure it
 > is in your PATH or set the PKG_CONFIG environment variable to the full
 > path to pkg-config.

 > I will send a patch today.

Thanks. Judging from the error message, that is most likely the reason
for the failure.

-- 
Bye, Peter Korsgaard
