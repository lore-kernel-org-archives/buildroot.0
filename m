From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 14:08:15 +0100
Subject: [Buildroot] [PATCH 1/1] libqrencode: select libpng only when
	tools are selected
In-Reply-To: <1383880239-2002-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 7 Nov 2013 22:10:39 -0500")
References: <1383880239-2002-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87vc00cslc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > As stated on the libqrencode web site, PNG (or SDL) is only
 > needed for the test and utility programs; the library itself
 > has no dependencies.

 > While we are here, remove spaces in the ifeq clause, to match
 > the examples in the buildroot manual.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
