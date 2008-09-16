From: Hai Zaar <haizaar@haizaar.com>
Date: Tue, 16 Sep 2008 10:21:24 +0300
Subject: [Buildroot] 2.6.26 crashes on at91sam9260ek
In-Reply-To: <87iqsxb6qj.fsf@macbook.be.48ers.dk>
References: <76d9e2a30809150900r5749d886r40425c5b8809b508@mail.gmail.com>
	<87iqsxb6qj.fsf@macbook.be.48ers.dk>
Message-ID: <cfb54190809160021g5bd3ae86o291a3f813d58f67f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 15, 2008 at 9:32 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Hai" == Hai Zaar <haizaar@haizaar.com> writes:
>
>  Hai> Good day, list!
>
>  Hai> I've had at91sam9260ek board running find with 2.6.24.7. The binaries
>  Hai> were built using buildroot r22989 (snapshot from end of the Jul).
>  Hai> Several day ago I've updated to recent buildroot and switched to
>  Hai> kernel 2.6.26.3 (latest one advertised by buildroot menuconfig).
>
> Sorry I don't have access to any at91 boards (Ulf, you told me long
> time ago you could provide me with one) - Does the new kernel work
> with the old file system and/or old kernel with new file system?
It does not even come the the stage to talk about file system. It
crashes way before it tries to mount ramdisk.

>
> --
> Bye, Peter Korsgaard
>



-- 
Zaar
