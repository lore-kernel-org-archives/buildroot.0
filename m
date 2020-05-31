From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 May 2020 14:41:49 +0200
Subject: [Buildroot] [PATCH 1/1] utils/check-package: add a check for
 the new spacing convention
In-Reply-To: <20200531122809.GB8737@scaer>
References: <20200205212211.29720-1-heiko.thiery@gmail.com>
 <20200531122809.GB8737@scaer>
Message-ID: <20200531124149.GC8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-05-31 14:28 +0200, Yann E. MORIN spake thusly:
> On 2020-02-05 22:22 +0100, Heiko Thiery spake thusly:
> > The seperation of the fields in the hash file should be 2 spaces for
> > consistency.
> > 
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> 
> I was thinking about this one recently, but we still have too many
> issues with it:
[--SNIP--]

Besides, it does not work for me:

    $ cat boot/afboot-stm32/afboot-stm32.hash
    # Locally calculated
    sha256  9b37b661bd3091ceb5d8dc5a56a2dfc02ae9ebc0c63dad3c4289c9d6b3d3ec89  afboot-stm32-0.2.tar.gz

    $ make check-package
    boot/afboot-stm32/afboot-stm32.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
