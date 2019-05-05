From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 May 2019 00:08:55 +0200
Subject: [Buildroot] [PATCH] package/libglib2: disable compiler warnings
In-Reply-To: <20190423145115.GA6590@lwo1-lhp-f71841>
References: <1556024465-7928-1-git-send-email-jugurtha.belkalem@smile.fr>
 <20190423162303.2683abfb@windsurf>
 <CAHpTZwnAembvxag_fe-=XFshSNtpisE5Un+Y2fRfW3==QtqAOg@mail.gmail.com>
 <20190423145115.GA6590@lwo1-lhp-f71841>
Message-ID: <d6134a3b-3f8b-f5e6-8f2f-3c44b8f091f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jugurtha,

On 23/04/2019 16:51, Vadym Kochan wrote:
> Hi Jugurtha, Thomas,
> 
> On Tue, Apr 23, 2019 at 04:45:34PM +0200, Jugurtha BELKALEM wrote:
>> Hi Thomas,
>>
>> I'm currently integrating the Qemu test from toolchain builder (
>> https://github.com/bootlin/toolchains-builder/blob/master/build.sh) into
>> buildroot to check the consistency of the build and get some ensurance that
>> Qemu build process went successful for the various Qemu architectures. This
>> why I have enabled host-qemu. When compiling without using
>> "--disable-compile-warnings"; I got this message :
>>
>>>>> host-libglib2 2.56.4 Patching libtool
>>>>> host-libglib2 2.56.4 Building
>> Failed build last output
>>   CC       libgio_2_0_la-glistmodel.lo
>>   CC       libgio_2_0_la-gliststore.lo
>>   CC       libgio_2_0_la-gapplication.lo
>> ....
>> ....
>> ....
>> cc1: some warnings being treated as errors
>> Makefile:3927: recipe for target 'libgio_2_0_la-gunixconnection.lo' failed
> 
> This is very similar error which was related to gettext-tiny libintl.h
> header but issue was fixed already (may be about 1 month ago).
> Could you please share the defconfig ?

 Since you didn't come back to this issue, I assumed it was resolved in the end
in some other way, so I've marked the patch as Rejected in patchwork.

 If it still is relevant, please repost it with an updated explanation.

 Regards,
 Arnout
