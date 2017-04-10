From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 13:51:05 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
 core
In-Reply-To: <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
 <20170408153452.54837e4c@free-electrons.com>
 <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
 <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
 <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
Message-ID: <20170410135105.6b246fa4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 11:08:21 +0200, Arnout Vandecappelle wrote:

>  In fact, I would forego the 'custom Xenomai version' support entirely. I don't
> see why you would ever want an older version, and if you need a newer version
> than the one in Buildroot you can just bump the package. Does anyone see a
> reason to support multiple versions? [Adding ThomasDS in Cc to answer that.]

I think the main reason is that Xenomai includes kernel patches, but
only for specific kernel versions. So if you're using a specific kernel
version, you might need to use a specific Xenomai version, and not just
"the latest".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
