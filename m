From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 23:06:43 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
 <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
 <20130204223024.0e687d5b@skate>
 <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
Message-ID: <511030F3.1060407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 22:37, Nicolas Dechesne wrote:
> another question: do we really want to have 100+ patches to upgrade to
> R7.7, or should we make 1 commit that bumps all components (and
> remove/add the relevant ones)? I am asking because i think that any
> 'commit' in between the 100+ patches could put BR in a bad state.. Of
> course if we upgrade just 1 specific component later on (before R7.8
> is made) then it can be made 'manually', but for large release
> upgrade, maybe 1 commit makes sense..

  I certainly prefer a single tested patch than 100 patches where the 
intermediate steps have not been tested.

  The server should perhaps be a separate patch, because it probably 
needs changes in the configure options as well. But then again, this 
could leave the tree in an unbuildable state...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
