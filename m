From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 10:34:30 +0200
Subject: [Buildroot] [PATCH v3 1/3] go-bootstrap: new host package
In-Reply-To: <20160422234944.13b0a8a3@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 22 Apr 2016 23:49:44 +0200")
References: <cover.1459798147.git.geoff@infradead.org>
 <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
 <20160420230245.2e5629d4@free-electrons.com>
 <20160422010950.GA28839@xdna.net>
 <20160422115129.4c4b523b@free-electrons.com>
 <20160422214156.GA2816@xdna.net>
 <20160422234944.13b0a8a3@free-electrons.com>
Message-ID: <878u04soyx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> When it is just the outputdir, I don't mind so much but when installed
 >> system-wide, I'm usually quite careful about what gets installed.
 >> 
 >> I could also just delete it in a post-install script. But not doing
 >> something is better than doing it and undoing it.

 > Your arguments make sense. Let's see what others think about it.

I also don't really see any better way. This solution is OK with me.

-- 
Venlig hilsen,
Peter Korsgaard 
