From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 21:34:47 +0100
Subject: [Buildroot] [PATCH 2/4] package/libopusenc: bump to version
 0.2.1
In-Reply-To: <20190101211531.788b58de@windsurf> (Thomas Petazzoni's message of
 "Tue, 1 Jan 2019 21:15:31 +0100")
References: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
 <20190101143702.2736-2-thomas.petazzoni@bootlin.com>
 <87ef9wqgu6.fsf@dell.be.48ers.dk> <20190101211531.788b58de@windsurf>
Message-ID: <87wonop15k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Tue, 01 Jan 2019 21:10:41 +0100, Peter Korsgaard wrote:
 >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
 >> 
 >> > This release fixes two minor bugs:
 >> > - a gapless bug in the LPC filtering
 >> > - a crash on destroy when using the pull API  
 >> 
 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
 >> 
 >> Committed, thanks.
 >> 
 >> Does this depend on opus 1.3

 > I don't think it does, it's really a point release with two bug fixes.

 >> / should this be added to the 2018.02.x / 2018.11.x branches?

 > Considering it's a bugfix only release, perhaps.

Ok, I'll backport it.

-- 
Bye, Peter Korsgaard
