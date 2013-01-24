From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 07:42:45 +0100
Subject: [Buildroot] root.fs tar fails on 2012.11 and 2013.x from today
In-Reply-To: <20130121185143.7b62db61@skate>
References: <CAG6aBkUKBBWJPAmQaP_scR4-7o=uLuu69vdp0nANVuoDhRnQCg@mail.gmail.com>
 <20130119000053.3f7eebc1@skate>
 <CAG6aBkX8i42SpZAeQ2oPBZOMdT+V125Nadr_OFMoVzNJCda+9Q@mail.gmail.com>
 <20130121181139.09c586ce@skate>
 <CAG6aBkXiBagJnL+CC-7CoVdrN+-rzf-89KpwZraPtt0XNWc4sg@mail.gmail.com>
 <20130121185143.7b62db61@skate>
Message-ID: <5100D7E5.1060707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 18:51, Thomas Petazzoni wrote:
> Dear Nigel Sollars,
>
> On Mon, 21 Jan 2013 12:26:41 -0500, Nigel Sollars wrote:
>
>> Oh I see what your saying,  basically the rule is dont use an older
>> config.  I am guess that manually changing the config to the new
>> location in this instance,  would be good enough for now..
>
> No, the rule is more "we should not break existing configurations". But
> sometimes we do, unfortunately. And in many cases, I am the one
> responsible for those changes that create incompatibility with existing
> configurations.
>
> Arnout recently added a "legacy" mechanism that should, in the future,
> help in making such changes less painful.

  Thomas,

  Would it be possible to add legacy config or .mk options that solve the 
migrated devtables and skeleton issue? Because this problem will not have 
gone away with the 2013.02 release, people will still be upgrading from 
2012.08 or earlier.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
