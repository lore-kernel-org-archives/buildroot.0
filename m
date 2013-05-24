From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 May 2013 07:16:59 +0200
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB,
 Bluetooth, Qt.
In-Reply-To: <20130523211223.59edf1b8@skate>
References: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
 <20130523165601.5fc0fe15@skate>
 <CAD0gWNZA=e-iQ+G98P5Hgi1Z_OBK0=P6TiHJ-+X0S_D+fih0PQ@mail.gmail.com>
 <20130523174630.0c7efe41@skate> <519E67FA.8060608@mind.be>
 <20130523211223.59edf1b8@skate>
Message-ID: <519EF7CB.30801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/05/13 21:12, Thomas Petazzoni wrote:
>>> > >Maybe (2) is what makes sense here. The cost of new options in terms of
>>> > >maintenance is not so high,
>> >
>> >   You forgot about updating the 'depends on' statements when a suboption
>> >wants to select e.g. glib...
> Hum, not sure to understand what you meant here. Did you mean
> "propagate the 'depends on'" from the selected package into the
> selecting package, for dependencies on toolchain features and things
> like that?

  Yes indeed. And the maintenance effort is to keep that up-to-date when 
heavily used libraries grow new dependencies.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
