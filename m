From: Markus Mayer <mmayer@broadcom.com>
Date: Sat, 8 Jul 2017 17:00:54 -0700
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <e5027435-15fb-ee00-6967-85da2e14d493@mind.be>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
 <20170705072538.GE3499@scaer> <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
 <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
 <e5027435-15fb-ee00-6967-85da2e14d493@mind.be>
Message-ID: <CAGt4E5tt65Q8R6DHij-dEa3bwW7P_+TV1qdRXqefFS2CV3SmeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8 July 2017 at 14:16, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 05-07-17 19:19, Markus Mayer wrote:
>> That said, and while I am a complete buildroot newbie, I do like the
>> suggestion of creating sub-directories for the tools and including the
>> makefiles from linux-tools.mk rather than relying on alphabetical
>> sorting.
>
>  If you're willing to upgrade from newbie to contributor, feel free to send a
> patch that does exactly this!
>
>  When you do, don't forget to update
> docs/manual/adding-packages-linux-kernel-spec-infra.txt
> as well.

Sounds good. Will do. :-)

-Markus
