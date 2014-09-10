From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 10:14:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-09
In-Reply-To: <87vbovewb3.fsf@dell.be.48ers.dk>
References: <20140910063013.732CF1018B1@stock.ovh.net>
 <87vbovewb3.fsf@dell.be.48ers.dk>
Message-ID: <20140910101455.016ca634@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 10 Sep 2014 10:04:00 +0200, Peter Korsgaard wrote:

>  >        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/be4e19d55b24c00b8b0fd12c9e5d1e9c5d8b0cb3/
>  >        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/24d1701d39b9b73ef98e141d514592845baa4b8e/
>  >        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/de070cd0eda96bbc96fda8e81cb54c0ae71652a5/
> 
> needs host-ncurses, fixed in git.

So the policy is now that curses is no longer mandatory, and we should
depend on host-ncurses when needed?

>  >       bfin | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/1484925122442c4063da6742f6280ccbaa5cbe29/
> 
> Needs !static, fixed in git.

Maybe we could also add a depends on BR2_arm, because building
snowball-hdmiservice on Blackfin seems a bit odd :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
