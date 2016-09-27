From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2016 15:10:38 +0200
Subject: [Buildroot] Buildroot nodejs 6.6.0
In-Reply-To: <CAFGQKxcFTgyOWB+h84PgRCVpcpTRYe1q9XrJe3B+dVZAycu1oQ@mail.gmail.com>
References: <6C0FD5AC-BA66-48C8-BC00-3F8393524B7B@bluecordial.com>
 <CAFGQKxf-pPGUuML2c6-0J4moQfJidxhRLcWOC8avA46gqHon7Q@mail.gmail.com>
 <87zimu30ny.fsf@dell.be.48ers.dk>
 <CAFGQKxcFTgyOWB+h84PgRCVpcpTRYe1q9XrJe3B+dVZAycu1oQ@mail.gmail.com>
Message-ID: <20160927151038.474df7de@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Sep 2016 09:22:02 +0100, Martin Bark wrote:

> > Thanks. From that list I also see that security support for the 0.10.x
> > series will end in October, so we should presumably remove 0.10.x
> > support before the 2016.11 release.  
> 
> The 0.10.x branch is only included for the armv5 since version > 0.10.x
> dropped support.  In the past there was discussion around leavening 0.10.x
> in buildroot even when support ended for it.  Personally i would like to
> drop 0.10.x to help tidy up the nodejs package but I'm fine with leaving it
> if people use it.

It is fine to support 0.10.x in Buildroot to support ARMv5 while 0.10.x
is still maintained upstream. But as Peter mentioned, the support for
0.10.x upstream will stop soon, so we should also remove it from
Buildroot.

Yes, it will leave people using ARMv5 without a NodeJS implementation,
but that's upstream decision. If those people are unhappy with upstream
decision, they should talk with upstream directly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
