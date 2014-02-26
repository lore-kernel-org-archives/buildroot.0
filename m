From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 18:39:44 +0100
Subject: [Buildroot] [RFC PATCH 0/10] add new virtual-package
	infrastructure
In-Reply-To: <CAB0FRssWBtzFimD0JShSj8Y7efvUWk4Ono_cgSxqw0uMLk0PTg@mail.gmail.com>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
 <CAB0FRssWBtzFimD0JShSj8Y7efvUWk4Ono_cgSxqw0uMLk0PTg@mail.gmail.com>
Message-ID: <530E26E0.8040407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 09:23, Fran?ois Perrad wrote:
> Dear Yann,
> 
> could you check your new infrastructure with these 2 patches :
>  http://patchwork.ozlabs.org/patch/323464/
>  http://patchwork.ozlabs.org/patch/323465/
> because for the first time, a virtual package is used on host and target side.
> 
> Note that the definition of LUAINTERPRETER_SOURCE is not enough,
> the definition of HOST_LUAINTERPRETER_SOURCE is required too.


 I was about to say that we don't need a host-virtual-package, but I
guess I was wrong :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
