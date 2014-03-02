From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 02 Mar 2014 11:45:55 +0100
Subject: [Buildroot] [PATCH 1/2] imagemagick: disable documentation
In-Reply-To: <20140302002238.2eb2d717@skate>
References: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
 <20140302002238.2eb2d717@skate>
Message-ID: <53130BE3.8080904@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/03/2014 00:22, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
>
> On Sun, 16 Feb 2014 00:57:47 +0100, Romain Naour wrote:
>> There is no options to disable the documentation,
>> so remove it directly in Makefile.am
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>   .../imagemagick/imagemagick-02-disable-doc.patch   | 47 ++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 package/imagemagick/imagemagick-02-disable-doc.patch
> Can you have a look at implementing the solution proposed by Arnout
> (i.e adding a --disable-docs or --disable-documentation configure
> option) ?

Not yet, but it's in my todo list.
I'll do it as soon as possible but I have another task to finish before.

> Also, it would be really great if you could push this patch, as well as
> the other patch we already have against imagemagick, to the upstream
> project.
This is what I planned to do :)

Best regards,
Romain
