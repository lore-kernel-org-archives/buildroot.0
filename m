From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Nov 2013 00:07:28 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
 November 17)
In-Reply-To: <5278143A.5070505@mind.be>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
 <527746D2.5000802@mind.be>
 <CAAXf6LXQ_1pYTCyr2nLwDa1J7kJUsSZCcbs03gr3OFaDPmX6gw@mail.gmail.com>
 <5278143A.5070505@mind.be>
Message-ID: <20131105000728.49c0d1a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 04 Nov 2013 22:40:10 +0100, Arnout Vandecappelle wrote:

>   I completely agree, that was the reason that I created the patch in
> the first place.
> 
>   Unfortunately, the x86_defconfig is _huge_. And as mentioned by 
> ThomasP, the other architecture's defconfigs aren't worth much. So I 
> don't think this patch is really valuable after all.

I agree. For anyone sane, x86_defconfig is basically unusable due to
the enormous number of options that it enables.

And for other architectures, a default defconfig doesn't make much
sense, since there usually isn't any "sane" default. I very much prefer
users to be asked loudly to provide a proper defconfig rather than
having Buildroot pick the kernel default one, and then have users
wonder why the kernel doesn't boot on their platform.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
