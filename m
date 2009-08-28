From: Will Newton <will.newton@gmail.com>
Date: Fri, 28 Aug 2009 17:31:17 +0100
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
	<2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
Message-ID: <87a5b0800908280931x523f6c88k1e006634d612425f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 28, 2009 at 5:20 PM, Bill Bogstad<bogstad@pobox.com> wrote:
> On Fri, Aug 28, 2009 at 10:49 AM, Peter Korsgaard<jacmet@uclibc.org> wrote:
>>>>>>> "Bill" == Bill Bogstad <bogstad@pobox.com> writes:
>>....
>>
>> It builds here without any problems. Have you set BR2_JLEVEL to
>> something else than 1? Could you please post your .config?
>
> FYI, I'm a total newbie where buildroot is concerned.
>
> Build Host: Ubuntu 8.04 with most native development packages
> installed and up to date patches.

buildroot does not seem to be happy with /bin/sh pointing at dash, it
would seem to require bash (I don't have any specific failures in
mind, but I have seen a few). I find it easiest just to make sure that
/bin/sh points at bash if I'm using Ubuntu.
