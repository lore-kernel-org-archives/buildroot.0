From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 15:39:43 +0200
Subject: [Buildroot] [PATCH 16/20] system: separate sysv and systemd
 parts of the skeleton
In-Reply-To: <da57b804-8b59-4c8b-b851-c90f61a8fefd@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f797589346d85a6ebba86bb418d6b818051d0da7.1500398733.git.yann.morin.1998@free.fr>
 <430c46f8-bb5d-a2bf-3695-6822609e0a2c@mind.be> <20170723102453.GE26998@scaer>
 <da57b804-8b59-4c8b-b851-c90f61a8fefd@mind.be>
Message-ID: <f1c6b608-8ac9-f4c2-c59d-05f3d6d1b893@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 15:32, Arnout Vandecappelle wrote:
> 
> 
> On 23-07-17 12:24, Yann E. MORIN wrote:
>> Arnout, All,
>>
>> On 2017-07-23 02:08 +0200, Arnout Vandecappelle spake thusly:
> 
> [snip]
>>> But the commit log should at least explain this.
>>
>> Like so, maybe?
>>
>>     For systemd, we only ever need an entry for /, because all the rest
>>     is totally irrelevant for systemd (it automatically mounts what it
>>     needs where it needs it).
> 
>  But... skeleton-common installs a lot more than just /, no? It installs
> /etc/stuff, and a bunch of top-level directories...

 Sorry, I missed that this was about fstab, I thought it was about the skeleton
itself.

 fstab is not yet mentioned at all in the commit message, so this should be
rephrased a little. But content-wise this is indeed what I wanted.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
