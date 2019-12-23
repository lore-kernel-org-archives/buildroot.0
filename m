From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:19:46 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <87zhfiu28h.fsf@dell.be.48ers.dk>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
 <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
 <20191222225727.7e8f88d4@windsurf> <20191223171658.GN26395@scaer>
 <87zhfiu28h.fsf@dell.be.48ers.dk>
Message-ID: <20191223231946.3f57ebe1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Alex in Cc. Alex, there's an open2300 question for you below.

On Mon, 23 Dec 2019 23:05:34 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > In practice, we have only two: fis and open2300. The other packages that
>  > may use svn are those where the user would set the version, so they
>  > would anyway be excluded from the hash check.  
> 
> Talking about those two packages, weren't we going to remove them? They
> are both very old and haven't been updated since they were added.

That's indeed another way. For the "fis" package, I think this is
reasonable, as even the use-case is very obsolete (RedBoot stuff). For
open2300, I'm not sure.

Alex: is open2300 still relevant today? You introduced this package in
Buildroot many years ago.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
