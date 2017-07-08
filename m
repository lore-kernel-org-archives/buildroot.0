From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jul 2017 23:16:12 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net> <20170705072538.GE3499@scaer>
 <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
 <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
Message-ID: <e5027435-15fb-ee00-6967-85da2e14d493@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 19:19, Markus Mayer wrote:
> That said, and while I am a complete buildroot newbie, I do like the
> suggestion of creating sub-directories for the tools and including the
> makefiles from linux-tools.mk rather than relying on alphabetical
> sorting.

 If you're willing to upgrade from newbie to contributor, feel free to send a
patch that does exactly this!

 When you do, don't forget to update
docs/manual/adding-packages-linux-kernel-spec-infra.txt
as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
