From: =?utf-8?Q?=C3=89tienne_Ph=C3=A9lip?= <etienne.phelip@savoirfairelinux.com>
Date: Mon, 10 Apr 2017 09:44:32 -0400 (EDT)
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <20170405181424.1d69fee5@free-electrons.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <20170401155116.66464885@free-electrons.com>
 <8760ilvozx.fsf@dell.be.48ers.dk>
 <2ce8812c-d95e-bd4a-9cde-f02ab8e3ca60@mind.be>
 <87wpazuaa1.fsf@dell.be.48ers.dk>
 <02a1a330-c947-2a64-29bb-88f6ac7d9c9f@mind.be>
 <20170405181424.1d69fee5@free-electrons.com>
Message-ID: <674007428.52191.1491831872252.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning everyone,

----- Le 5 Avr 17, ? 12:14, Thomas Petazzoni thomas.petazzoni at free-electrons.com a ?crit :

> Hello,
> 
> On Wed, 5 Apr 2017 17:02:36 +0200, Arnout Vandecappelle wrote:
> 
>>  Combined with the other discussion in this thread, long-term I see us evolving
>> towards:
>> 
>> - deprecate some of the finer-grain fs tuning options we have now;
>> - always using genimage to generate the target filesystems;
>> - position our fs targets more as a 'quick fix' solution than for production;
>> - make host-e2fsprogs etc. blind options again.
> 
> To be honest, I am not sure I share this long-term view. I like the way
> things are done today, very modular: we can generate just a filesystem
> image, optionally use genimage afterwards, etc. So the "always using
> genimage to generate the target filesystem" is not something that I see
> as an improvement, for example.

To sum things up:
 - Should I add BR2_GENIMAGE_CFG_FILES or reuse the script in the
postimage script
 - if BR2_GENIMAGE_CFG_FILES is choosen, should it 'depends on' or
'select' BR2_PACKAGE_HOST_GENIMAGE?
 - should I convert all boards or just the one already in this RFC?

Best regards
-Etienne
