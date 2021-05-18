From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 11:19:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: drop
 BR2_PACKAGE_LVM2_APP_LIBRARY
In-Reply-To: <46aee4a7-5baf-49b5-889a-aaead48f5501@benettiengineering.com>
References: <20210517170609.810302-1-fontaine.fabrice@gmail.com>
 <20210517170609.810302-2-fontaine.fabrice@gmail.com>
 <20210517204324.GH2506@scaer>
 <CAPi7W83SZL9j2iEvi8DM6EBVJfXksN5-WsGZXnSundeHfYHOYA@mail.gmail.com>
 <8bce0504-8c29-5868-bd66-c998ece91eae@benettiengineering.com>
 <46aee4a7-5baf-49b5-889a-aaead48f5501@benettiengineering.com>
Message-ID: <20210518091905.GO2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-05-18 10:34 +0200, Giulio Benetti spake thusly:
> On 5/18/21 9:58 AM, Giulio Benetti wrote:
> >On 5/17/21 10:51 PM, Fabrice Fontaine wrote:
> >>Le lun. 17 mai 2021 ? 22:43, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
[--SNIP--]
> >>>I was a bit concerned that we dropped this support, but hinestly, we
> >>>have udisks 1.0.5, from March 2014... So, to me, it's a minor annoyance
> >>>if lvm2 support in udisks is dropped...
> >>>IIRC, Adam, did some work on udisks back when he was "toying" with GOI...
> >>>Adam? ;-)
> >>We also have a patch to bump udisks from Giulio:
> >>https://patchwork.ozlabs.org/project/buildroot/patch/20200217143030.5031-5-giulio.benetti at benettiengineering.com/
> >>Perhaps, Giulio could also help us to bump udisks.
> >I can try to re-bump since at the time I thought there were a lot of
> >dependencies while Adam(if I recall correct) told me that GOI wasn't
> >needed in libblock for example. So I'm retrying to bump with the minimum
> >dependencies. Let's see if I'm able to do this.
> Pardon, I've also noticed this Adam's patch to bump that has been rejected:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200725230618.3640682-14-aduskett at gmail.com/
> 
> But I can't find the reason why it's been rejected. I've applied it and it
> builds after some adjustment without lvm2 for the moment, then I can respin
> it if everything is ok with a second patch re-adding lvm2 support.

IIRC, there was some back-n-forth on IRC about various technical
details, like NLS handling and use of msgfmt:
    http://lists.busybox.net/pipermail/buildroot/2020-July/287917.html
    http://lists.busybox.net/pipermail/buildroot/2020-August/290568.html

But indeed, there is no summary on the list... :-/

If you can combine and rework the previous attempts (yours and Adam's)
and respin that, with a commit log that explains the issues and how they
were fixed, that'd be great!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
