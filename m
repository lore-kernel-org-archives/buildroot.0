From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Sep 2012 10:22:43 +0200
Subject: [Buildroot] Host xmllint dynamic link failure
In-Reply-To: <5062BA88.3000906@mind.be>
References: <50624463.1000200@mind.be> <20120926093025.0ba0c3d0@skate>
 <5062BA88.3000906@mind.be>
Message-ID: <5062BB53.8030808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/12 10:19, Arnout Vandecappelle wrote:
>   xmlto is used to generate the documentation in the new X11 packages
> (not sure if it was the case before already).  Disabling documentation
> also works :-).

  Actually that's a third workaround (which just hides the problem :-): we
currently don't have --disable-doc in the configure of host-packages.  I
don't think we really need to build the docs for host packages, do we?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
