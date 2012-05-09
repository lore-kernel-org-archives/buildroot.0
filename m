From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 8 May 2012 23:47:57 -0400
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <20120509034511.GA26002@sapphire.tkos.co.il>
References: <1336526367-11516-1-git-send-email-golubovsky@gmail.com>
 <20120509034511.GA26002@sapphire.tkos.co.il>
Message-ID: <CADiAo4+U+dz3YBPRh7T6ArwCsm5YivzdmnXDs5nV+_fCoGphZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Tue, May 8, 2012 at 11:45 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Dmitry,
>
> Two more comments.
>> +
>> +ifeq ($(BR2_i386),y)
>> + ? ? x86emu = n
>> +endif
>> +
>> +ifeq ($(BR2_x86_64),y)
>> + ? ? x86emu = y
>> +endif
>
> We generally use capitals for variable names. Also, this can be shortened to
>
> ? ?X86EMU = $(if $(BR2_i386),n,y)

This is a local variable - still uppercase?

>
> But you don't used the CFLAGS variable. Please correct the comment.

Right, I'll correct this.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
