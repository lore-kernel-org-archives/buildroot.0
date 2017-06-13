From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jun 2017 23:41:40 +0200
Subject: [Buildroot] [PATCHv2] package/systemd: fix paths to runtime
	utilities
In-Reply-To: <20170610231005.4d6871ec@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 10 Jun 2017 23:10:05 +0200")
References: <20170609190347.23681-1-yann.morin.1998@free.fr>
 <20170610231005.4d6871ec@windsurf.home>
Message-ID: <878tkvbm5n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri,  9 Jun 2017 21:03:47 +0200, Yann E. MORIN wrote:
 >> systemd's configure is looking in $PATH to find utilities that will be
 >> needed at runtime.
 >>
 >> package/systemd/systemd.mk | 16 ++++++++++++++--
 >> 1 file changed, 14 insertions(+), 2 deletions(-)

 > Applied to master, thanks. Peter: I believe this should go in the LTS
 > branches.

Agreed - Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
