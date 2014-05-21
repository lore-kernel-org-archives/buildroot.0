From: Will Newton <will.newton@gmail.com>
Date: Wed, 21 May 2014 09:16:33 +0100
Subject: [Buildroot] [PATCH 1/1] Add support for ld.gold in toolchain.
In-Reply-To: <20140521054008.GC618@waldemar-brodkorb.de>
References: <BLU436-SMTP2194D0C95F4AFEB38829312A83D0@phx.gbl>
 <20140521054008.GC618@waldemar-brodkorb.de>
Message-ID: <CAFbHwiSC5PqzTXLHmCuG7WWuz=Gvy4tSzrTZFPPYwiP3JxEL3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 21, 2014 at 6:40 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Hi Steve,
> Steve Thomas wrote,
>
>> The ld.gold linker has been around for about six years, and is quite
>> well supported. It also used to be the only linker for gcc that
>> supported the plugin option needed for LTO.
>>
>> This patch enables a system to be build with the gold linker which is
>> very well supported on recent builds.
>
> But gold is not available for all architectures. I am sure it does
> not work for MIPS f.e.

gold also has problems (or at least did) building working kernels on ARM.
