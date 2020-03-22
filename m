From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 22 Mar 2020 16:01:51 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/cegui: rename and bump
 version
In-Reply-To: <20200322154844.46f59068@windsurf.home>
References: <20200318085125.12843-1-b.bilas@grinn-global.com>
 <20200321165503.7baa0173@windsurf.home>
 <0d04353d-faf2-35d2-5a58-cb293ef52f86@grinn-global.com>
 <20200322135714.GD2364@scaer> <20200322154844.46f59068@windsurf.home>
Message-ID: <7f054928-2858-431f-1948-ba995dbf1c46@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 22.03.2020 15:48, Thomas Petazzoni wrote:
> On Sun, 22 Mar 2020 14:57:14 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
>> We still want to forcibly enable/disable optional features rather than
>> leave them to chance. Also, if your target is x86_64 and your build
>> machine is also x86_64 (for example), then if you machine has one of
>> thedependencies installed, the CEGUI buildsyste,m may find them, instead
>> of those from Buildroot.
>>
>> So, we still want to have the proper enable/disable options.
> The thing is that from what I could see, the cegui build system doesn't
> provide any of these enable/disable options. It really only relies on
> automatic detection.
>
> Thomas

It seems that we can force override some of available options that are 
set automatically.

Best
Bartek
