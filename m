From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jun 2017 22:31:01 +0200
Subject: [Buildroot] [PATCH] roseapplepi: backport upstream patches to
	fix build with gcc 6
In-Reply-To: <20170620221906.702e8c96@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 20 Jun 2017 22:19:06 +0200")
References: <20170620114952.16292-1-peter@korsgaard.com>
 <20170620213008.652bc050@windsurf.lan>
 <87shiue87y.fsf@dell.be.48ers.dk>
 <20170620221906.702e8c96@windsurf.lan>
Message-ID: <87o9tie70a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 20 Jun 2017 22:04:49 +0200, Peter Korsgaard wrote:

 >> > What do you think?  
 >> 
 >> Yeah, it isn't really nice. I was also hessitating between sticking to
 >> gcc5 or add the patches, but as mainline support seems to be finally
 >> moving forward for this SoC (and we already carried patches for building
 >> with gcc 5.x), I went for the patches.

 > Regarding mainline support, I have no idea how far it is today. But
 > from experience, it takes a very long time to move from the
 > serial+MMC+Ethernet supported to a state where display+audio+GPU is
 > supported. So mainline may not necessarily be a drop-in replacement
 > before a long time.

Yes, I know - But for a buildroot defconfig, serial+MMC+ethernet is
fine. We also don't have support the GPU or VPU in Buildroot today.

-- 
Bye, Peter Korsgaard
