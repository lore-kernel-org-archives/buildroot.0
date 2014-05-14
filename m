From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 May 2014 10:11:57 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <20140513180945.GC3507@free.fr>
References: <20140513180945.GC3507@free.fr>
Message-ID: <5373254D.2060501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/14 20:09, Yann E. MORIN wrote:
>   - add a choice to select one and only provider at a time, and make all
>     the providers prompt-less config options so it is not possible to
>     choose more than one at a time;

 I'm really against this. One of the great things about the current virtual
package infrastructure is that it makes it possible to avoid a choice construct.
And it still is possible to have the choice construct as well. Just perfect.


> 
>   - add a pre-build check that verifies that not two providers of the
>     same feature are selected, and bail out early in the build if that
>     is the case.

 With Yann's proposed patch I think this is really feasible.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
