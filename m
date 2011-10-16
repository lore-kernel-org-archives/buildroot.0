From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sun, 16 Oct 2011 19:39:37 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 4.44
In-Reply-To: <2247f2bf1f89d0ba0b3eba6b94afe5d1@zacarias.com.ar>
References: <20111015213701.E38898E24C@busybox.osuosl.org>
 <4E9A9A26.2050409@free-electrons.com>
 <2247f2bf1f89d0ba0b3eba6b94afe5d1@zacarias.com.ar>
Message-ID: <4E9B16D9.2070200@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/2011 14:53, Gustavo Zacarias wrote:
> On 16.10.2011 05:47, Maxime Ripard wrote:
> 
>> There's a problem with that. They have a kind of silly policy to
>> store the archives. In the "main" folder, there is only the latest
>> version, while every other version are in obsolete/4.x/. So this will
>> break as soon as a new version will be released, and that was why I
>> put obsolete in the first place.
>>
>> Maxime
> 
> Yes, i've noticed, however they don't keep a copy of the latest version
> in obsolete.
> As long as it's mirrored in sources.buildroot.net it should be safe.

But do we really need the latest version here ?

Also, how the mirror is generated ? At each release or at a given
frequency ? Because, in the first case, if a new version is released
between this commit and the release, we're screwed.

> Maybe fallback/alternate download URLs could be implemented?

Indeed, that's a good idea.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
