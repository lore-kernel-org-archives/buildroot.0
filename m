From: czankel <chris@zankel.net>
Date: Sun, 09 Jun 2013 12:49:36 -0700
Subject: [Buildroot] strace-4.8
In-Reply-To: <CAC1BbcT6+-VddQUEmZGJdYVvxa_2ZFs3O4pGBpJ6YBiUk10Cjw@mail.gmail.com>
References: <51B0DB7A.3070507@zankel.net>
 <13f1b4af906.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
 <CAC1BbcT6+-VddQUEmZGJdYVvxa_2ZFs3O4pGBpJ6YBiUk10Cjw@mail.gmail.com>
Message-ID: <51B4DC50.1060607@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard,

On 6/7/13 12:34 AM, Bernhard Reutner-Fischer wrote:
> On 6 June 2013 23:01, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
> The LFS one should not be needed anymore. It sounds a bit like the 
> TCB_WAITEXECVE was fixed, too, but better verify this yourself.
Had to do a little bit of research. The TCB_WAITEXECVE patch currently 
in Buildroot had been added to strace in 2007 (commit: 9bc6340d2, 
released with 4.6) but was later replaced with a generic solution in 
2011  (commit: 2ce12ed31c2, released with 4.7).

I'll create patch for strace shortly.

Thanks,
-Chris
