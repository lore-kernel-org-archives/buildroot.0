From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Apr 2015 22:10:11 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <20150417173642.5fa56833@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 17 Apr 2015 17:36:42 +0200")
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>
 <552CF0E1.5090205@mind.be>
 <20150414135424.3b1ab04a@free-electrons.com>
 <552D65C3.6010106@mind.be>
 <20150417173642.5fa56833@free-electrons.com>
Message-ID: <87618qv9wc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> >  2) Simply filter out from $$(ROOTFS_$(2)_DEPENDENCIES) the targets
 >> >     that start with 'rootfs-' when adding them to the PACKAGES variable.
 >> >     Maybe not that pretty either, but very simple to do.
 >> 
 >> Sounds acceptable, though not ideal.

 > Not ideal, but very minimal in its impact.

Indeed. I also think this is the way to go right now.

>> So for now, I'd go for option 2. I've checked and it looks like rootfs-* are
 >> the only non-package dependencies that appear anywhere (I can't be 100% sure
 >> though).

 > Ok, I'll go ahead and implement this. Thanks again for all the in-depth
 > review, testing, and useful feedback!

Thanks!

-- 
Bye, Peter Korsgaard
