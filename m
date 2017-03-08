From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 8 Mar 2017 20:33:26 +0100
Subject: [Buildroot] [PATCH 6/6] efl: remove broken JP2K loader
In-Reply-To: <CAPdpN3AVrF=v3mJQdZUhB=DAqDwOf8kaVpc8Uqc0RWSQfvSurQ@mail.gmail.com>
References: <20170307235054.25149-1-arnout@mind.be>
 <20170307235054.25149-6-arnout@mind.be>
 <CAPdpN3AVrF=v3mJQdZUhB=DAqDwOf8kaVpc8Uqc0RWSQfvSurQ@mail.gmail.com>
Message-ID: <924c67c6-88be-ba6c-2098-1af06bdb5564@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

Le 08/03/2017 ? 13:49, Gustavo Sverzut Barbieri a ?crit :
> On Tue, Mar 7, 2017 at 8:50 PM, Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:
>>
>> This option has been marked as broken since 2016.08. Since nobody
>> repaired it, we'll just remove it.
>>
>> Since technically it was already removed in 2016.08, it's added to the
>> 2016.08 section of the legacy menu.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Romain Naour <romain.naour@gmail.com>
>> Cc: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> 
> Reviewed-By:  Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> 
>> ---
>> Romain, Gustavo, last chance to unbreak the package :-)

I reported the issue upstream, see:

https://phab.enlightenment.org/T5255

At the time when I tested this option openjpeg was still at 1.x version but it
was bumped to 2.x after that.

efl 1.19 will be released soon (1.19-beta2 right now) it may be fixed before the
official release.

Otherwise:
Acked-by: Romain Naour <romain.naour@gmail.com>

Because it's still broken :-/

Best regards,
Romain
