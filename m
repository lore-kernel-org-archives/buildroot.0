From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 23:22:44 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: fix custom patch dir legacy
	handling
In-Reply-To: <20161220230014.030d3f0d@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 20 Dec 2016 23:00:14 +0100")
References: <1482203412-5361-1-git-send-email-danomimanchego123@gmail.com>
 <87tw9z7yw6.fsf@dell.be.48ers.dk>
 <06d55d32-6d74-0daa-8770-5b7e56deab81@mind.be>
 <871sx271oc.fsf@dell.be.48ers.dk>
 <CANxTyt52z7zKV59o9Qfs-EGTTHPZBX3w3ddsammdEu20CuotQw@mail.gmail.com>
 <87wpeu5l6a.fsf@dell.be.48ers.dk>
 <20161220230014.030d3f0d@free-electrons.com>
Message-ID: <87oa065jgr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 20 Dec 2016 22:45:49 +0100, Peter Korsgaard wrote:

 >> > I noticed it now because we are upgrading from 2014.05 to 2016.11.  We
 >> > use both the uboot custom patch dir feature (replaced) and the linux
 >> > custom path feature (dropped, frowny face), so I'm hitting those right
 >> > now.  
 >> 
 >> Ok. The replacement for both is simply BR2_GLOBAL_PATCH_DIR (with linux
 >> patches under linux/ and u-boot patches under uboot/).

 > Not completely true: the "linux custom path" feature is not replaced by
 > BR2_GLOBAL_PATCH_DIR. If one wants to get the same functionality, i.e
 > telling Buildroot to use the Linux kernel source code from an available
 > local directory, then the only solution is to use LINUX_OVERRIDE_SRCDIR.

Sorry, I read it as 'custom patch' feature, not 'custom path'.

-- 
Bye, Peter Korsgaard
