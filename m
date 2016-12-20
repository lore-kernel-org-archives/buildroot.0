From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 20 Dec 2016 16:22:41 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: fix custom patch dir legacy
	handling
In-Reply-To: <871sx271oc.fsf@dell.be.48ers.dk>
References: <1482203412-5361-1-git-send-email-danomimanchego123@gmail.com>
 <87tw9z7yw6.fsf@dell.be.48ers.dk>
 <06d55d32-6d74-0daa-8770-5b7e56deab81@mind.be>
 <871sx271oc.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt52z7zKV59o9Qfs-EGTTHPZBX3w3ddsammdEu20CuotQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 20, 2016 at 4:04 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  >> Nice detailed description! Committed, thanks.
>
>  >  This is 2016.11.x material.
>
> It has been broken since 2016.05-rc1, but OK - We can indeed add it for
> 2016.11.x

I noticed it now because we are upgrading from 2014.05 to 2016.11.  We
use both the uboot custom patch dir feature (replaced) and the linux
custom path feature (dropped, frowny face), so I'm hitting those right
now.

Danomi -
