From: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 20 Nov 2019 12:43:25 +0100
Subject: [Buildroot] [PATCH v2] umtprd: Add package
In-Reply-To: <20191119173224.439c01b6@windsurf.home>
References: <20191113112136.24211-1-paul@crapouillou.net>
 <20191119173224.439c01b6@windsurf.home>
Message-ID: <1574250205.3.2@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


Le mar., nov. 19, 2019 at 17:32, Thomas Petazzoni 
<thomas.petazzoni@bootlin.com> a ?crit :
> Hello Paul,
> 
> I've applied to next, after doing some small changes, see below.

Alright, thanks!

-Paul

> On Wed, 13 Nov 2019 12:21:36 +0100
> Paul Cercueil <paul@crapouillou.net> wrote:
> 
>>  uMTP-Responder is a lightweight USB Media Transfer Protocol (MTP)
>>  responder daemon for GNU/Linux.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> The commit title should have been:
> 
> 	package/umtprd: new package
> 
>>  +UMTPRD_VERSION = 1.0.0
>>  +UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
>>  +UMTPRD_LICENSE = GPL-3.0
> 
> The license really is GPL-3.0+, all source files have the "or later"
> option.
> 
> Applied with those two issues fixed. Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
