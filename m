From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 21:28:10 +0100
Subject: [Buildroot] [PATCH] infra: don't be verbose when calling the
 instrumentation steps
In-Reply-To: <CAAXf6LUDaJ5eKtPCmYOsni0=VYOEF1q8zouwrkvB7Bqrh_ai-g@mail.gmail.com>
References: <20200222103848.10236-1-yann.morin.1998@free.fr>
 <CAAXf6LX6G0c72v8rx1W9maf4ERKffKyo9qsSaN+qdsd=OOG-7g@mail.gmail.com>
 <20200222110541.GE17342@scaer>
 <CAAXf6LUDaJ5eKtPCmYOsni0=VYOEF1q8zouwrkvB7Bqrh_ai-g@mail.gmail.com>
Message-ID: <20200222202810.GM17342@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-02-22 21:17 +0100, Thomas De Schampheleire spake thusly:
> El s?b., 22 feb. 2020 a las 12:05, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > On 2020-02-22 11:59 +0100, Thomas De Schampheleire spake thusly:
> > > On Sat, Feb 22, 2020, 11:38 Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > >   +       @$(call step_pkg_size_file_list,$(TARGET_DIR))
> > >   +       @$(call step_pkg_size_finalize)
> > >   +       @$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
> > >   +       @$(call step_pkg_size_finalize,-staging)
> > >   +       @$(call step_pkg_size_file_list,$(HOST_DIR),-host)
> > >   +       @$(call step_pkg_size_finalize,-host)
> > >
> > > Perhaps this should rather be $(Q) than @?
[--SNIP--]
> > Care to send a patch afterwards, that changes the existing code? ;-)
> Sure, I can do that.

Is that an Acked-by or Reviewed-by from you on my patch, then? ;-)

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
