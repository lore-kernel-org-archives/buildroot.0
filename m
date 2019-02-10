From: Bastian Breit <bastian.breit.buildroot@gmail.com>
Date: Sun, 10 Feb 2019 15:40:34 +0100
Subject: [Buildroot] [PATCH] add library xmlsec1
In-Reply-To: <20190210152019.353bc305@windsurf.home>
References: <20190209215351.29395-1-basti171@gmail.com>
 <20190210103749.50caf547@windsurf.home>
 <CACHoAdp2+4-E8_KroYibuYxoFeT2groW-3-H+WS-M0aQDFvCDA@mail.gmail.com>
 <20190210152019.353bc305@windsurf.home>
Message-ID: <CACHoAdqKNDEJZBRfMA6Dd4JrzWyDTiCp4=LaarzAyvq6D03dhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

> Which trouble did you encounter ?

Too much emails to my main account. I therefore was not sure how to
answer to the mailinglist, but it seemed to work.
Therefore git send-email needed the password in the gitconfig.
I also wanted to better seperate opensource & private account. So
everything is fine now.

> No you don't have to support all options. If you don't support an
> option (like gnutls or gcrypt), then do like you did: disable support
> for it explicitly in the .mk file.

in the faqs, there seems to be problems with other libraries. Maybe we
will try out gnutls, then I will push changes upstream.

> Send all in one patch, labeled as "v2", with a changelog below the
> "---" sign:
>
>         git format-patch -v2 HEAD^
>
> Edit the 0001-...patch file, and below the --- sign, add some notes
> that explains what you changed since v1.

Okay.
Sincerely

Bastian
