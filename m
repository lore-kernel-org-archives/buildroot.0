From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Nov 2018 10:22:02 +0100
Subject: [Buildroot] [PATCH next] package/glibc: update hash of LICENSES
 file for ARC version
In-Reply-To: <20181121081845.23739-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 21 Nov 2018 09:18:45 +0100")
References: <20181121081845.23739-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736ruoked.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 5d4f23cbe65c79826b1b2071e972803a453934cb ("toolchain: Bump
 > ARC tools to arc-2018.09-rc1"), the glibc version for the ARC
 > architecture was bumped, but the hashes of the license files were not
 > updated accordingly, causing a build failure during "legal-info":

 > ERROR: LICENSES has wrong sha256 hash:
 > ERROR: expected: 61abdd6930c9c599062d89e916b3e7968783879b6be0ee1c6229dd6169def431
 > ERROR: got     : 35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f

 > The changes between the previous LICENSES file and the new one are:

 >  - The text related to libidn has been removed from the LICENSES file,
 >    following the switch to libidn2:

 >    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=7f9f1ecb710eac4d65bb02785ddf288cac098323#patch2

 >  - The text related to stdio-common/tst-printf.c has been removed from
 >    the LICENSES file, following the removal of this non-free code from
 >    glibc:

 >    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5a357506659f9a00fcf5bc9c5d8fc676175c89a7#patch2

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
