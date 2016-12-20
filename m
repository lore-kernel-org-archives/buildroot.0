From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Dec 2016 23:56:54 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: fix custom patch dir legacy
 handling
In-Reply-To: <CANxTyt7w5QA3rQYsOZ7Vev1d4-aVddVX48Oxdc065PTao6pbyg@mail.gmail.com>
References: <1482203412-5361-1-git-send-email-danomimanchego123@gmail.com>
 <87tw9z7yw6.fsf@dell.be.48ers.dk>
 <06d55d32-6d74-0daa-8770-5b7e56deab81@mind.be>
 <871sx271oc.fsf@dell.be.48ers.dk>
 <CANxTyt52z7zKV59o9Qfs-EGTTHPZBX3w3ddsammdEu20CuotQw@mail.gmail.com>
 <87wpeu5l6a.fsf@dell.be.48ers.dk>
 <20161220230014.030d3f0d@free-electrons.com>
 <CANxTyt7w5QA3rQYsOZ7Vev1d4-aVddVX48Oxdc065PTao6pbyg@mail.gmail.com>
Message-ID: <20161220235654.54e8c810@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 17:55:41 -0500, Danomi Manchego wrote:

> Understood.  It's just that using a custom path for boot loaders and
> the kernel is the norm for us, not an exception.  In fact, I've never
> been on a project where we were able to use a main line kernel or
> uboot.  Sometimes, we'll go through the exercise of making patches
> against an initial state of a vendor's git repo, but many of out
> project leaders prefer to just source control everything locally.
> Under those circumstances, it's nicer to have the local path in the
> defconfig than in a secondary local.mk or in the .mk file itself.

If your U-Boot / Linux kernel source code is under version control, why
don't you ask Buildroot to pull it from your Git/SVN/Mercurial/whatever
repository ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
