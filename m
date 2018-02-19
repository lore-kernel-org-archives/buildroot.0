From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 19 Feb 2018 18:23:45 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version
 1.7.990
In-Reply-To: <20180219090504.745c4841@windsurf.lan>
References: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
 <1518799091-845-2-git-send-email-jared.bents@rockwellcollins.com>
 <20180216215334.7385e898@windsurf.lan>
 <361202886.84859.1518998584797.JavaMail.zimbra@datacom.ind.br>
 <20180219090504.745c4841@windsurf.lan>
Message-ID: <2137381520.124019.1519075425250.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Jared Bents" <jared.bents@rockwellcollins.com>, "buildroot" <buildroot@buildroot.org>
> Sent: Monday, February 19, 2018 5:05:04 AM
> Subject: Re: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version 1.7.990

> Hello,
> 
> On Sun, 18 Feb 2018 21:03:04 -0300 (BRT), Carlos Santos wrote:
> 
>> > Are you sure 1.7.990 isn't a development version ? Interestingly, their
>> > Git repo has no tag with this name:
>> > https://cgit.freedesktop.org/ModemManager/ModemManager/refs/tags. It
>> > has a 1.8-rc1 version. So it does feel like 1.7.x might be a
>> > development version. Could you double check this ?
>> 
>> It is a development version. That's why I submitted an update to the
>> latest release version, which is 1.6.12:
>> 
>>     https://patchwork.ozlabs.org/patch/871059/
> 
> When is the final 1.8.x version expected ? If it's in the very near
> future (i.e before 2018.05-rc1), then we could accept the 1.7.x bump for
> now, and move to 1.8.x when it lands. Otherwise, I'd prefer to stick
> with 1.6.x for now.

The announcement message[1], from Sun Jan 21, informs that 1.7.990
corresponds to 1.8-rc1. From the list of 1.5.99x releases, which spans
several months, I believe that 1.8 will unlikely be released before
the end of February.

Notice that I'm sympathetic to upgrading the Buildroot package to
1.7.990, since this release includes the quectel plugin. Currently I
need to maintain that change as a local patch in my BR2_LOCAL.

1. https://lists.freedesktop.org/archives/modemmanager-devel/2018-January/006157.html

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
