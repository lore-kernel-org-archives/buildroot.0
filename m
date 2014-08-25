From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:47:38 +0200
Subject: [Buildroot] Analysis of build results
In-Reply-To: <CAPiYbR+VwHhH1V0bkhqg0QTLMQVdJKbORq4cTsOSbmFjwvF2UA@mail.gmail.com>
References: <20140825063011.07B50101AB1@stock.ovh.net>
 <20140825181614.3f5c22a0@free-electrons.com>
 <CAPiYbR+VwHhH1V0bkhqg0QTLMQVdJKbORq4cTsOSbmFjwvF2UA@mail.gmail.com>
Message-ID: <20140825194738.4758d655@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Mon, 25 Aug 2014 18:26:04 +0200, Phil Eichinger wrote:

> >     mipsel |                   sispmctl-3.1 | NOK |
> > http://autobuild.buildroot.net/results/6473088e751d3ab3a5227e9d7876966934e66378/
> >
> > Static linking issue.
> >
> > Phil, since you are the original submitter of the sispmctl package, can
> > you look into this issue?
> >
> 
> Yep, no problem, going to need it on mipsel soon anyway.

Ok, thanks. However, notice that the issue is not mipsel related, but
related to static linking. I'm pretty sure the same issue can be
reproduced on other architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
