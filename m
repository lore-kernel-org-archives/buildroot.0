From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 11:32:59 +0200
Subject: [Buildroot] [PATCH 2/2] mke2img: add parameter sanity checks to
 prevent odd error messages from genext2.fs
In-Reply-To: <20170430092533.GB12749@scaer>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
 <1493481682-128366-2-git-send-email-g4@novadsp.com>
 <20170429210606.37872b68@free-electrons.com>
 <20170430092533.GB12749@scaer>
Message-ID: <20170430113259.0dd3eb78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 11:25:33 +0200, Yann E. MORIN wrote:

> > $ ./package/mke2img/mke2img -b
> > mke2img: option 'b' expects a mandatory argument
> > 
> > So it is already checked that ${nb_blocks} cannot be empty.  
> 
> But if you don't pass the -b option, then nb_blocks *is* unset.
> 
> Adding the check is correct in my opinion.

Ah, yes agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
