From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jan 2021 22:38:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-reentry: add host
 variant
In-Reply-To: <ar1r3hxkiu.ln2@ID-313208.user.individual.net>
References: <20191025185448.32633-1-asafka7@gmail.com>
 <20191025185448.32633-6-asafka7@gmail.com>
 <ar1r3hxkiu.ln2@ID-313208.user.individual.net>
Message-ID: <20210105213841.GJ1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-09-23 07:08 +0200, Bernd Kuhls spake thusly:
> Am Fri, 25 Oct 2019 21:54:48 +0300 schrieb Asaf Kahlon:
> > Packages which use reentry will have setup_requires=['reentry'] and
> > reentry_register=True in their setup.py.
> > A host variant is needed in order to invoke reentry when building the
> > package and register the entrypoints.
> as you pointed out in http://patchwork.ozlabs.org/project/buildroot/patch/
> 20191020190142.18672-2-asafka7 at gmail.com/
> 
> 	"I don't see any Buildroot package which uses reentry..."
> 
> I think that your patch should not be applied to buildroot atm.

I concur, so I have now marked that patch as rejected in patchwork.

If in the future we introduce a package that needs it, then will be the
time to eventually add the host variant for reentry.

Thanks!

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
