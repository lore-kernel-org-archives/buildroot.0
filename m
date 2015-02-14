From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 14 Feb 2015 10:19:45 +0100
Subject: [Buildroot] [PATCH v4 1/3] package/mono: enable mono library
	compilation
In-Reply-To: <20150214101712.2e14149e@free-electrons.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-2-git-send-email-angelo.compagnucci@gmail.com>
 <20150214075839.5ee08252@free-electrons.com>
 <CA+TH9Vnswp+zP1Han+xkLZxCQO+HPwNvTTMqKbWZ_5-Gbij4mQ@mail.gmail.com>
 <20150214101712.2e14149e@free-electrons.com>
Message-ID: <CA+TH9Vkg8AYDecZCQYpWAJvxivPwRMO=Yn2qz=qOTpa6hDzaHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-02-14 10:17 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Sat, 14 Feb 2015 09:53:56 +0100, Angelo Compagnucci wrote:
>
>> libmono* size is ~6mb and the overrall size of mono with only 4.5
>> libraries is ~60mb so it's a ~3.6%. If think it's too much, I'll add
>> an option to enable/disable compilation of it.
>
> 6 MB of 60 MB is 10%, not 3.6%.

Honestly I don't know why i wrote such and idiocy, sorry!

> But ok, fair enough, I believe it's
> quite reasonable to have this by default: Mono is anyway a huge beast.
> I'll apply this patch.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
