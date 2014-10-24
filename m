From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Oct 2014 16:06:24 -0700
Subject: [Buildroot] Buildroot developer meeting report
In-Reply-To: <483025893.317038.1414179145585.JavaMail.yahoo@jws10056.mail.ne1.yahoo.com>
References: <5447A95E.2090008@mind.be>
 <483025893.317038.1414179145585.JavaMail.yahoo@jws10056.mail.ne1.yahoo.com>
Message-ID: <20141024230623.GA14818@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2014-10-24 19:32 +0000, Doug Kehn spake thusly:
> Hi Arnout, Everyone,
> I'm new to Buildroot and have been evaluating it along with Yocto to replace uClinux/home-brew environment for a new design.  I
> noticed in the 'Discussion_topics_and_report' that there was an evaluation of BR2_EXTERNAL.  Was it determined what was needed?  I
> hope this wasn't a foreshadowing that BR2_EXTERNAL might be deprecated.

No, BR2_EXTERNAL is not deprecated at all. It is a relatively new
feature, and at the previous developpers days, some users expressed some
concerns about some behaviour of BR2_EXTERNAL, because it was new at
that time.

Since those concerns were unfounded, so the topic was only briefly
skimmed over in D?sseldorf, and the conclusion was that "everything is
OK".

So, you can count on BR2_EXTERNAL for the foreseeable future. :-)

> As part of my evaluation, I created a 'doug' directory and mimicked the Buildroot directory structure as needed.  All my custom bits
> were confined to this directory; I didn't pollute the Buildroot tree with irrelevant changes.  I then use BR2_EXTERNAL to point to
> 'doug'.  For example,
> make BR2_EXTERNAL=doug [defconfig]
> set up the environment to point to all the proper locations.  BR2_EXTERNAL, as is, is a very nice feature!

Yup, that's how it is expected to be used. Nice to see you like it! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
