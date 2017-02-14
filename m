From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 16:10:59 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <87lgt8kepo.fsf@dell.be.48ers.dk>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <87lgt8kepo.fsf@dell.be.48ers.dk>
Message-ID: <20170214161059.6a096f81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 15:51:47 +0100, Peter Korsgaard wrote:

> Yes, I believe so (this failures are with gcc 6.x). I had a quick look
> yesterday, and our synergy package is ancient. It seems to have moved to
> github and changed quite a bit since then.
> 
> https://github.com/symless/synergy/
> 
> The last release in the 1.3.x series is 1.3.8. I'll take a look and see
> if that has fixed this issue.

See:

  [PATCH 1/1] package/synergy: bump to version 1.8.5

on the mailing list. But that's a rather big update, with somewhat
scary things.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
