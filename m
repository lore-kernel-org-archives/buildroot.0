From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Dec 2014 18:59:18 +0100
Subject: [Buildroot] [PATCH v5 4/4] guile: Add new package
In-Reply-To: <547B9A19.6060705@paguilar.org>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
 <1416869790-12988-5-git-send-email-paguilar@paguilar.org>
 <20141126215542.433523bf@free-electrons.com>
 <547B9A19.6060705@paguilar.org>
Message-ID: <20141201175918.GA4150@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-30 23:28 +0100, Pedro Aguilar spake thusly:
> I confirm you that guile is building and running fine for me, I used an
> Atmel SAMA5 processor.

I already noticed at least one build failure with bdwgc:
    http://autobuild.buildroot.net/results/529/529b0b6dd47744c13f56e59a4c669a3f5d56530d/

;-p

I have a fix I'll be sending sonish.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
