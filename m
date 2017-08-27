From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sun, 27 Aug 2017 12:00:19 +0200
Subject: [Buildroot] [PATCH v2] modem-manager: update dependencies
In-Reply-To: <20170827092336.1f6ed439@windsurf>
References: <20170825123015.10667-1-aleksander@aleksander.es>
 <20170825142120.26160-1-aleksander@aleksander.es>
 <20170825224135.6b053399@windsurf>
 <CAAP7uc+iakpbUqhHcrczfvEjdXDTwEvq3+yoOxcAzR4eYtR7ww@mail.gmail.com>
 <20170827092336.1f6ed439@windsurf>
Message-ID: <CAAP7ucJDbVb4fVgi-3G751PSQu44tyieZM38izbZh-cN9FFYBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Understood; yes DBus is only runtime dependency, so the Config.in
>> change would be enough.
>
> Well, the package already has "select BR2_PACKAGE_DBUS", so that
> shouldn't require any change.
>

Yeah, I meant the (already existing) Config.in entry would be enough,
no change expected there, sorry for the confusion.

>> I guess the same happens with udev then? MM
>> doesn't build-depend on udev, only on gudev (although it seems that
>> gudev itself depends on udev).
>
> Then yes, having "udev" in MODEM_MANAGER_DEPENDENCIES is useless.
>

Will update the patch and resend, thanks for the clarifications.

-- 
Aleksander
https://aleksander.es
