From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 17:14:00 +0100
Subject: [Buildroot] [git commit master 1/1] cdrkit: fix build with
	ccache
In-Reply-To: <20110124170817.628499e6@surf> (Thomas Petazzoni's message of
	"Mon, 24 Jan 2011 17:08:17 +0100")
References: <20110120202551.3757C8B537@busybox.osuosl.org>
	<20110124170817.628499e6@surf>
Message-ID: <87tygyth2v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Thu, 20 Jan 2011 21:23:23 +0100
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> Cmake gets confused about ccache, so don't use ccache for cmake builds.

 Thomas> Which problems did you had exactly ?

See the quoted error message in the libcuefile thread:

http://lists.busybox.net/pipermail/buildroot/2011-January/040755.html

(and followups)

 Thomas> While this is obviously the right short-term fix, it's a bit of
 Thomas> a shame of CMake doesn't play well with ccache, so maybe it's
 Thomas> something I could raise on the CMake mailing-list.

Indeed. We left it here for you to have fun with once you're back from
holidays :P

-- 
Bye, Peter Korsgaard
