From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Mar 2014 07:16:58 +0100
Subject: [Buildroot] Status of wayland package
In-Reply-To: <532880A0.3020604@carallon.com>
References: <532880A0.3020604@carallon.com>
Message-ID: <533270DA.5070701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/14 18:21, Will Wagner wrote:
> Hello,
> 
> I'm just starting to look at a new project and was interested in using
> wayland.
> 
> Can anyone tell me the status of the package in buildroot? According to
> http://wayland.freedesktop.org/building.html there are quite a lot of
> dependencies for wayland that don't seem to be reflected in buildroot. Is
> it just that the wayland docs are very out of date?

 There aren't that many dependencies, and buildroot has them. Buildroot
also has the wayland package, and since Yann regularly bumps it I guess
it works for him.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
