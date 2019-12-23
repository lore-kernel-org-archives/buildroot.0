From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:36:50 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <20191223231946.3f57ebe1@windsurf> (Thomas Petazzoni's message of
 "Mon, 23 Dec 2019 23:19:46 +0100")
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
 <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
 <20191222225727.7e8f88d4@windsurf> <20191223171658.GN26395@scaer>
 <87zhfiu28h.fsf@dell.be.48ers.dk> <20191223231946.3f57ebe1@windsurf>
Message-ID: <871rsuu0sd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > +Alex in Cc. Alex, there's an open2300 question for you below.

As far as I can see, you didn't actually put Alex in CC.

 > On Mon, 23 Dec 2019 23:05:34 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > In practice, we have only two: fis and open2300. The other packages that
 >> > may use svn are those where the user would set the version, so they
 >> > would anyway be excluded from the hash check.  
 >> 
 >> Talking about those two packages, weren't we going to remove them? They
 >> are both very old and haven't been updated since they were added.

 > That's indeed another way. For the "fis" package, I think this is
 > reasonable, as even the use-case is very obsolete (RedBoot stuff). For
 > open2300, I'm not sure.

 > Alex: is open2300 still relevant today? You introduced this package in
 > Buildroot many years ago.

-- 
Bye, Peter Korsgaard
