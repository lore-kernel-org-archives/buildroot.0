From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 09:38:00 +0100
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <50125101.8080300@mind.be>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
 <50117709.8060209@mind.be> <20120727084503.045fbb14@skate>
 <50125101.8080300@mind.be>
Message-ID: <CAHt8ZCO-6TdZ73M40qfX+jSJp8dNid-qFeLh0EySFy7BopS=pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 July 2012 09:27, Arnout Vandecappelle <arnout@mind.be> wrote:
>  I think it depends a bit on the situation.  For openssl support, it
> makes more sense to just add it when available, because it normally
> doesn't increase the size of the binary (much) to have openssl support
> enabled.
>
>  However, sconeserver (and vlc as well) are modular packages, which you
> can basically view as a collection of sub-packages.  So in that case,
> it does make more sense to select which modules you want to have
> enabled.
>
>  So for sconeserver, I prefer to keep all the sub-options.  Except
> maybe the SSL module, that's not really a separate server but a
> library wrapper, so it should probably be selected automatically if
> openssl is.

Yes, I tend to agree.

Simon.
