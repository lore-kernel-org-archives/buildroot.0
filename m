From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 31 Oct 2017 11:20:03 +0100
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <20171030204054.723cdc99@windsurf>
References: <20171030163121.939-1-norbert.lange@andritz.com>
 <20171030204054.723cdc99@windsurf>
Message-ID: <CADYdroP3-gaXzRy61r7FraPq+g6MeB5CUGN_nFLyFy3MxxfVvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I dont know about the autobuilder (can I upload configs to test
there?), this is an issue I encountered with a private buildroot
config.
I tried to reduce it as much as possible, and added the defconfig.

2017-10-30 20:40 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 30 Oct 2017 17:31:21 +0100, Norbert Lange wrote:
>> The build of doc/examples/cmake-multiple-shared-libraries
>> does fail as a dependend library is missing.
>> This issue is not specific to builroot and should ideally
>> be fixed upstream (Issue: https://bugs.lttng.org/issues/1132)
>>
>> The fix is done without any indepth knowledge of the CMake
>> mechanisms, but seems to work correctly
>>
>> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
>
> Which specific build problem are you fixing? Is this a problem that has
> been found by http://autobuild.buildroot.org? If that's the case, we
> like to include a reference to such an autobuilder failure in the
> commit log.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: lttng_failbuild_defconfig
Type: application/octet-stream
Size: 349 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171031/92381c6f/attachment.obj>
