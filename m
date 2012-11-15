From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 17:02:54 +0100
Subject: [Buildroot] [PATCH 2/6] uClibc: remove useless
	linuxthreads-errno-fix patch
In-Reply-To: <878va250xn.fsf@dell.be.48ers.dk>
References: <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
 <cover.1352987586.git.thomas.petazzoni@free-electrons.com>
 <898dc2c84add1fd58f43193bcfda39d64c0ae523.1352987586.git.thomas.petazzoni@free-electrons.com>
 <878va250xn.fsf@dell.be.48ers.dk>
Message-ID: <20121115170254.080348ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 15 Nov 2012 16:40:52 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> This patch has since a long time been merged upstream in uClibc, so it
>  Thomas> cannot apply on any of the recent uClibc snapshots.
> 
> I like it how you call my patches useless :P

Sorry if the wording sounded rude. The patch has been merged upstream
since quite some time, so it has become useless as a separate patch in
Buildroot, but it certainly was useful since it got merged upstream.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
