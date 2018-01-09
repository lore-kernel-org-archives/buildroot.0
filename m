From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 16:36:08 +0100
Subject: [Buildroot] [PATCH 1/1] board/ci20: Implement creation of a
 basic sdcard image for ci20
In-Reply-To: <CAMbDF3JqN=7DxC3N1KBAkBsrPYn6AU=+Tn0ct=AQsNMmNWw8cg@mail.gmail.com>
References: <1515504542-26528-1-git-send-email-johannes.schmitz1@gmail.com>
 <20180109153854.774a0b7c@windsurf>
 <CAMbDF3JqN=7DxC3N1KBAkBsrPYn6AU=+Tn0ct=AQsNMmNWw8cg@mail.gmail.com>
Message-ID: <20180109163608.6126ca99@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot mailing list in Cc, thanks!

On Tue, 9 Jan 2018 16:30:37 +0100, Johannes Schmitz wrote:

> > The toolchain changes are really unrelated, they shouldn't be part of
> > the same patch.
> 
> The problem without the patch I can not even complete the build, I get an
> error, so how is it unrelated?
> I can split it again but I don't think it is completely unrelated.

So today the current ci20_defconfig is broken ?

At the very least, the gcc flag patch should be separate, with a proper
commit log that explains what is going on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
