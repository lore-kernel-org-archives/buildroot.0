From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Oct 2016 20:31:52 +0200
Subject: [Buildroot] [PATCH] pkg-download: fix fetching URLs with ? from
	PRIMARY/SECONDARY
In-Reply-To: <20161023145420.6172618b@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 23 Oct 2016 14:54:20 +0200")
References: <20161021202715.16528-1-arnout@mind.be>
 <20161023145420.6172618b@free-electrons.com>
Message-ID: <87lgxench3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> package/pkg-download.mk | 8 ++++++--
 >> 1 file changed, 6 insertions(+), 2 deletions(-)

 > Applied to master, after s/SECONDARY/BACKUP/.

 > Peter can you take the appropriate actions in sources.b.o ?

Yes. From a quick look it seems I copied files instead of renaming them,
so everything should be good (I'll leave the copies for older BR
versions).

-- 
Venlig hilsen,
Peter Korsgaard 
