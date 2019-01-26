From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jan 2019 15:06:22 +0100
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <871s55ykoj.fsf@dell.be.48ers.dk>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
 <871s55ykoj.fsf@dell.be.48ers.dk>
Message-ID: <20190126150622.23c7375e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Jan 2019 18:39:24 +0100, Peter Korsgaard wrote:

> > I thought it was using the version compiled by buildroot.
> > Isn't that what host-xz is being used for?  
> 
> Yes, correct. Do you know if the -T 0 option generates identical output
> as -T 1? Otherwise we may want to disable it for reproducible builds.

Does it matter than the output of -T 0 and -T 1 are identical ?

What matters for BR2_REPRODUCIBLE=y is if the same input, with -T 0,
always provide the exact identical output.

Am I missing something here ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
