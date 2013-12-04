From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 22:07:13 +0100
Subject: [Buildroot] [PATCH 1/2] python-pygame: rename package's
	Config.in bool
In-Reply-To: <20131204214504.72430e0b@skate> (Thomas Petazzoni's message of
 "Wed, 4 Dec 2013 21:45:04 +0100")
References: <1381165041-9024-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20131204214504.72430e0b@skate>
Message-ID: <87fvq8jpfi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Ryan Barnett,
 > On Mon, 7 Oct 2013 11:57:20 -0500, Ryan Barnett wrote:
 >> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
 >> 
 >> ---
 >> Trivial Fix:
 >> This makes the naming of the package in the menuconfig consistent with
 >> the naming of the package's directory and make rules.
 >> ---
 >> package/python-pygame/Config.in |    2 +-
 >> 1 files changed, 1 insertions(+), 1 deletions(-)

 > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
