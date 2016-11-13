From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Nov 2016 22:24:15 +0100
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <CAHCOiUTEDHwLTqF6_UE2nWuYc+zgstCqYLbSpHY0_tBzF=v5+A@mail.gmail.com>
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
 <20161109212812.39399895@free-electrons.com>
 <37cfb466-91a2-2434-24a4-dbd13ddfbc0f@openmailbox.org>
 <20161109231339.6a4830c6@free-electrons.com>
 <CAHCOiUTEDHwLTqF6_UE2nWuYc+zgstCqYLbSpHY0_tBzF=v5+A@mail.gmail.com>
Message-ID: <b4463231-ea51-a135-0cdd-dfc938898ee9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-11-16 11:28, Thijs Vermeir wrote:
> Hi,
> 
> On Wed, Nov 9, 2016 at 11:13 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Wed, 9 Nov 2016 23:01:12 +0100, C?dric Marie wrote:
>>
>>> Le 09/11/2016 ? 21:28, Thomas Petazzoni a ?crit :
>>>> We are definitely fine with supporting the meson build system in
>>>> Buildroot. The only reason we didn't merge the patches that were
>>>> proposed is because no package was using them. As soon as we have one
>>>> package using this build system in Buildroot, we will of course happily
>>>> merge patches adding support for it.
>>>
>>> The current gstreamer1 version in Buildroot is 1.8.3.
>>> The support for meson was added in 1.9.2. So upgrading gstreamer1 is
>>> certainly necessary before merging Meson support.
>>
>> OK. However, isn't 1.9.x considered a "development" branch from the
>> point of view of GStreamer? At least for Glib/Gtk, the releases with
>> an odd are development ones if I remember correctly.
> 
> Yes, that is correct. GStreamer 1.10.0 is now the latest stable
> release. Note that the
> support for the meson build system is only experimental and not on par
> with the autotools
> based build system.

 Perhaps then it would be good for the GStreamer project if the meson build
system would be (build)-tested by the buildroot autobuild infrastructure, no?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
