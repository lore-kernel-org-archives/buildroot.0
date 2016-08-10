From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 23:07:59 +0200
Subject: [Buildroot] [PATCH] lxc: version bump to 2.0.3
In-Reply-To: <CANQCQpbmvKn82AugTx+Cn9dut9L3ju5tJuZcv0DECp9D5PHmMQ@mail.gmail.com>
References: <1470858192-29796-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160810223905.41faf40a@free-electrons.com>
 <CANQCQpbmvKn82AugTx+Cn9dut9L3ju5tJuZcv0DECp9D5PHmMQ@mail.gmail.com>
Message-ID: <20160810230759.4c68137b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 15:48:38 -0500, Matthew Weber wrote:

> > Could you give more details here? Also, your justification to not add a
> > comment on top of AUTORECONF = YES sounds bogus. If there is an
> > AUTORECONF = YES, then there must be a comment on top of it that
> > explains why.  
> 
> We debated on leaving the comment in.  How does this sound?
> 
> # Re-configuring to selectively use libseccomp

Why is autoreconfiguring needed? The configure script is not up-to-date
with the provided configure.ac? As it is, the explanation doesn't
really help :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
