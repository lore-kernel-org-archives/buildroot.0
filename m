From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 3 Oct 2011 20:21:31 +0200
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <20111001113902.2aeff98d@skate>
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate> <20110930214150.770f09e1@skate>
 <CAAXf6LUKtv1Cs-gEfGj4Aq9wLe3N0tiKHDxniv39dW+RwoQOjw@mail.gmail.com>
 <20111001113902.2aeff98d@skate>
Message-ID: <CAAXf6LXV-aQgMNarenZa0ZpWpytQZKbeBnL83wKr5E-eK_bCOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 1, 2011 at 11:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 30 Sep 2011 23:12:52 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> An eglibc toolchain built with crosstool-ng, also works (both
>> compilation as running on target).
>
> Ok. It would be good to identify whether Valgrind can be built with
> uClibc with additional configuration options, or if glibc/eglibc is
> really needed. In the former case, additional documentation in the
> Config.in help would be good. In the latter case, some additional
> "depends on" to hide valgrind when uClibc is used would be nice.

Agreed. I will try to look at this when I have some time.

Best regards,
Thomas
