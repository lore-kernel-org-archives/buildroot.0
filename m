From: Carlos Soto <csotoalonso@gmail.com>
Date: Mon, 12 Oct 2015 20:37:55 +0200
Subject: [Buildroot] Change build directory por a package
In-Reply-To: <CAD7j7Q9eO6nEgW=FwdXjc2MtMZ-bJyYZc+ZmPpTkM1XwnzgFTQ@mail.gmail.com>
References: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
 <20151012110903.7dd3ab79@free-electrons.com>
 <CAD7j7Q9eO6nEgW=FwdXjc2MtMZ-bJyYZc+ZmPpTkM1XwnzgFTQ@mail.gmail.com>
Message-ID: <CAD7j7Q8VbbHZmO6RP9bsRaX1DfuEitGKeERoadtfC-Hm7R4GJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

Anyway, it sure compiles, but it is only because it is configured for
> static linking. As soon as I remove this config option from sdl2.mk
>
> # We must enable static build to get compilation successful.SDL2_CONF_OPTS += --enable-static
>
> the problem I reported appears again and the compilation ends with an error.
>
> I was a bit confused about the meaning of this configuration flag. I
thought it meant to compile the .so library static, but instead it means
building the static libSDL.a library. So no harm in letting it live ;-)

There are some other issues with the SDL2 patch, but I'm not sure if this
is the right place to discuss them or maybe I should look in the mailing
list for the right thread?

Thanks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151012/996a999d/attachment.html>
