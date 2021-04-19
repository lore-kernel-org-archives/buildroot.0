From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Apr 2021 19:04:31 +0200
Subject: [Buildroot] Unable to apply a patch for the buildroot makedevs
 tool
In-Reply-To: <AM6PR05MB59287FC07838F6A013DC9C9DA3499@AM6PR05MB5928.eurprd05.prod.outlook.com>
References: <AM6PR05MB5928D4AD5D2311ACA772CCA5A34C9@AM6PR05MB5928.eurprd05.prod.outlook.com>
 <20210417071317.GO359705@scaer>
 <AM6PR05MB59287FC07838F6A013DC9C9DA3499@AM6PR05MB5928.eurprd05.prod.outlook.com>
Message-ID: <20210419170431.GA298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan, All,

On 2021-04-19 05:58 +0000, Ivan Castell spake thusly:
> Please, proceed applying the patch, of course!

Can you please send the patch with:
  - a proper commit title
  - a proper commit log
  - your signed-off-by line

And then use 'git send-email' to actually send the patch.

See the manual for extensive explanations on how to send a patch:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

See also the actual 'git log' for examples pertaining to makedevs:

    git log package/makedevs/makedevs.c

Commit bdbbc72934bc7 (makedevs: support optional files) is a good
example: it also adds a new feature to makedevs, so you can model your
commit log after that one for example.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
