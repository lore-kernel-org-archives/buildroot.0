From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 6 Aug 2015 10:35:44 +0200
Subject: [Buildroot] [RFC] package/pulseaudio: fix musl build
In-Reply-To: <20150806090425.1917eff0@free-electrons.com>
References: <1438370022-25257-1-git-send-email-romain.naour@openwide.fr>
 <20150806090425.1917eff0@free-electrons.com>
Message-ID: <55C31C60.6070609@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 06/08/2015 09:04, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Fri, 31 Jul 2015 21:13:42 +0200, Romain Naour wrote:
>> pulseaudio doesn't build properly on musl due to
>> a OSS wrapper called padsp. It provide a software OSS
>> interface on systems without OSS.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>> Patches not upstreamed yet.
> 
> Could you send your patches upstream, and see what is upstream
> reaction? That's quite a bit of patches, to support a fairly odd setup
> (a big thing such as pulseaudio, with a small size C library such as
> musl). So I'd prefer to have such patches upstreamed.

Sure, I'll send theses patches upstream probably this weekend.
I've sent to the ml if our musl guys can have a look ;-)

Best regards,
Romain
> 
> Thanks,
> 
> Thomas
> 
