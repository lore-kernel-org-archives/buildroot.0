From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 2 Mar 2014 08:57:01 +0100
Subject: [Buildroot] [PATCH 00/24] lua
In-Reply-To: <20140301164220.4f73c2ed@skate>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <20140301160904.29570bf8@skate>
 <CAB0FRsvjjar89GLR85i=3xZg5-ULaa5OJHmj__xLgRToAkAktA@mail.gmail.com>
 <20140301164220.4f73c2ed@skate>
Message-ID: <CAB0FRsvRDA6cXz_eabQM76ZCJkraFVhMohZiL2+xkLipg7CfVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-03-01 16:42 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Fran?ois Perrad,
>
> On Sat, 1 Mar 2014 16:34:35 +0100, Fran?ois Perrad wrote:
>
>> Our dependencies are handled by Buildroot,
>> Luarocks can handle its own by fetching/building/installing,
>> but we don't want that, so Luarocks is called like this :
>>     $$(LUAROCKS_RUN) make --deps-mode=none
>>
>> And Luarocks does nothing with dependency except emitting this warning.
>
> Ok, thanks for the clarification. Maybe if --deps-mode=none is passed,
> luarocks could avoid emitting this warning, in order to reduce the
> possible confusion for users?
>

Fixed for the next release of LuaRock,
see the merged pull request https://github.com/keplerproject/luarocks/pull/236

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
