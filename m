From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 09:52:24 +0100
Subject: [Buildroot] [PATCH v2] libnspr: add microblaze support
In-Reply-To: <20140203223329.234d8b62@skate> (Thomas Petazzoni's message of
 "Mon, 3 Feb 2014 22:33:29 +0100")
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
 <1390859507-31670-5-git-send-email-spenser@gillilanding.com>
 <20140203223329.234d8b62@skate>
Message-ID: <87bnynmf93.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Spenser Gilliland,
 > On Mon, 27 Jan 2014 15:51:41 -0600, Spenser Gilliland wrote:
 >> fixes autobuild failures
 >> 
 >> http://autobuild.buildroot.net/results/493/4932900522e87da84a47fbf2d796c2fbb3f7e741/build-end.log
 >> 
 >> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 >> ---
 >> package/libnspr/libnspr-0001-nios2.patch      | 71 +++++++++++++++++++++++++
 >> package/libnspr/libnspr-0002-microblaze.patch | 76 +++++++++++++++++++++++++++
 >> package/libnspr/libnspr-nios2.patch           | 71 -------------------------
 >> 3 files changed, 147 insertions(+), 71 deletions(-)
 >> create mode 100644 package/libnspr/libnspr-0001-nios2.patch
 >> create mode 100644 package/libnspr/libnspr-0002-microblaze.patch
 >> delete mode 100644 package/libnspr/libnspr-nios2.patch

 > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
