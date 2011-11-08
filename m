From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 8 Nov 2011 09:33:41 +0100
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <87y5vrd13v.fsf@macbook.be.48ers.dk>
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate> <20110930214150.770f09e1@skate>
 <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
 <20111001113902.2aeff98d@skate>
 <CAAXf6LXV-aQgMNarenZa0ZpWpytQZKbeBnL83wKr5E-eK_bCOA@mail.gmail.com>
 <CAAXf6LVTAU73avFA3BJXEvcbVoQj6er1PFg-ntjLo9F3tc6hOA@mail.gmail.com>
 <87y5vrd13v.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LUJw3_6x_kXfP2QBQV0YoyODnaW4EnSJdx1ehHFKmFBcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Nov 7, 2011 at 11:22 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
> Hi,
>
> ?Thomas> Possible solutions?
> ?Thomas> 1. Modify uClibc so that it does not depend on the linux a.out.h file,
> ?Thomas> but rather provides its own definitions as eglibc does.
> ?Thomas> 2. Modify the kernel so that powerpc also provides a.out.h
>
> I looked into this a few years ago, and option 2 is not an option as the
> aout stuff is old and shouldn't be used:
>
> https://lkml.org/lkml/2008/6/15/126
>
> ?Thomas> 3. Modify buildroot to state that valgrind can not be build with uClibc.
>
> 4. Fix valgrind to not include a.out.h
>
> It's not really used for much - Have you seen this thread?
>
> http://old.nabble.com/How-to-disable-the-a.out-support-of-valgrind-td29226733.html

I hadn't seen it no, but it looks indeed a good alternative solution.

I'll add it to my list, but I don't think I can look into this soon.
So, if anyone has some free time, feel free to take this over.

Best regards,
Thomas
