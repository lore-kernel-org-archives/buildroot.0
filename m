From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 30 Jul 2012 11:16:43 -0400
Subject: [Buildroot] [PATCH] Makefile.package.in: GIT: add support to
 fetch git submodules
In-Reply-To: <CAAAP30GkyENCJYs8NrrfME0=eaOOMBR1qeMi8MsRAegXx8gV9Q@mail.gmail.com>
References: <1330435519-21011-1-git-send-email-aletes.xgr@gmail.com>
 <201202282232.28362.arnout@mind.be>
 <CAAAP30GkyENCJYs8NrrfME0=eaOOMBR1qeMi8MsRAegXx8gV9Q@mail.gmail.com>
Message-ID: <CA+-urNQ15ETrJ-pMEG=JJoCB3dytppTfeK=Eov9g2zJp104TyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre and all,

On Tue, Feb 28, 2012 at 6:54 PM, Alexandre Pereira da Silva
<aletes.xgr@gmail.com> wrote:
>>  I'm a bit concerned with the impact this will have on performance, e.g.
>> when cloning a linux git.  Could you evaluate that?
>>
>>  Regards,
>>  Arnout
>
> I just saw a problem in this first implementation. I am storing not
> only the checkout but the git repository as well. I will exclude those
> files and resend the patch.

I was wondering if there had been any progress or further thoughts on
adding support for fetching git submodules. I just ran into a
situation where your patch would have been convenient.

Thanks,
Frank
