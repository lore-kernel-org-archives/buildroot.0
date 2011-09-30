From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Sep 2011 11:39:27 +0200
Subject: [Buildroot] Status of valgrind on powerpc
In-Reply-To: <20110929121549.4bb68988@skate>
References: <CAAXf6LUVQc9JRgoOiKy84BnsiRLqXOxHbd6k+1RzQMpRQA4T0w@mail.gmail.com>
 <20110929121549.4bb68988@skate>
Message-ID: <CAAXf6LVPsz68F7dj8ifQezy=OXKh=KgLEB6_H=5BR9MOXS4zDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 29, 2011 at 12:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 29 Sep 2011 11:50:14 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Hence my question: is it supposed to work now? If yes, what am I
>> missing? (This is buildroot-2011.05 with the latest valgrind changes).
>> I will try buildroot-2011.08 to see if it works better.
>
> I think I did the compile test with a CodeSourcery glibc based
> toolchain for PowerPC. Maybe I have missed build problems with uClibc.

Ok, thanks. I am currently building a crosstool-ng eglibc toolchain,
and will try enabling valgrind on top of that.

~Thomas
