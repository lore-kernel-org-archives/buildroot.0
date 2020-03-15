From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:29:35 +0100
Subject: [Buildroot] [PATCH/next v1] package/bcm2835: bump version to
 1.62
In-Reply-To: <20200305234044.329c43ac@windsurf> (Thomas Petazzoni's message of
 "Thu, 5 Mar 2020 23:40:44 +0100")
References: <20200302104047.23560-1-ps.report@gmx.net>
 <20200305234044.329c43ac@windsurf>
Message-ID: <877dzlnc6o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon,  2 Mar 2020 11:40:47 +0100
 > Peter Seiderer <ps.report@gmx.net> wrote:

 >> Changelog (since 1.60):
 >> - 1.61 2020-01-11 Fixed errors in the documentation for bcm2835_spi_write.
 >> Fixes issue seen on Raspberry Pi 4 boards where 64-bit off_t is used by
 >> default via -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64. The offset was
 >> being incorrectly converted, this way is clearer and fixes the problem.
 >> Contributed by Jonathan Perkin.
 >> - 1.62 2020-01-12 Fixed a problem that could cause compile failures with
 >> size_t and off_t
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> ---
 >> package/bcm2835/bcm2835.hash | 4 ++--
 >> package/bcm2835/bcm2835.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Since the number of changes is really small, and limited to bug fixes,
 > I've applied to master.

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
