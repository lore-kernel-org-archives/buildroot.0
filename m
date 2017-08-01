From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 1 Aug 2017 19:18:51 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] util-linux: bump to v2.30.1
In-Reply-To: <444949365.2448670.1501499178309.JavaMail.zimbra@datacom.ind.br>
References: <20170729153602.22599-1-m.hoffmann@cartelsol.com>
 <444949365.2448670.1501499178309.JavaMail.zimbra@datacom.ind.br>
Message-ID: <357934249.2888641.1501625931554.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Marcus Hoffmann" <m.hoffmann@cartelsol.com>
> Cc: buildroot at buildroot.org
> Sent: Monday, July 31, 2017 8:06:18 AM
> Subject: Re: [Buildroot] [PATCH 1/1] util-linux: bump to v2.30.1

>> From: "Marcus Hoffmann" <m.hoffmann@cartelsol.com>
[...]
>> @Carlos: As far as I could find no upstream discussion has taken place
>> regarding the 0001 patch right? Do you want to send an email to the list
>> describing the problem?
> 
> Hum, I got distracted with other things here. I will take care of this
> today. Thanks for the reminder!

After exchanging some messages with Karel Zak we found simple a solution
for the the problem of building util-linux without a separate ncursesw.
include dir. It is on the master branch of util-linux and hopefully will
be included in some 2.30.x release.

--
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
