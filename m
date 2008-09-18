From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 18 Sep 2008 09:01:04 +0200
Subject: [Buildroot] oprofile build error related to gcc
In-Reply-To: <87k5dav9kg.fsf@macbook.be.48ers.dk>
References: <ccdbf7fe0809171138q281529d6tf964e5bec4a1ffbe@mail.gmail.com>
	<87k5dav9kg.fsf@macbook.be.48ers.dk>
Message-ID: <20080918090104.0de32924@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Sep 2008 21:47:27 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "J" == J Lee <jameslee05@gmail.com> writes:
> 
>  J> I got this error while I was building oprofile for a powerpc
>  J> target. I have checked gcc directories but I did not see any
>  J> gcc_s_nof. How can I get around this?
> 
> I don't know right away, but oprofile got updated this morning to 0.94
> - Could you give that a try?
> 

Hopefully 0.9.4 will work, the test case was to compile on AVR32 and
PowerPC, and they passed.

The previous oprofile in Buildroot was pretty broken and would probably
not work for anybody.

-- 
Best regards,
Hans-Christian Egtvedt
