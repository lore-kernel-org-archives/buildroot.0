From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 15 Jan 2016 18:53:45 +0100
Subject: [Buildroot] Standardizing format for specifying license(s)
In-Reply-To: <20160115145153.39e486e3@free-electrons.com>
References: <5698DDBE.3000402@imgtec.com>
 <1a9e07dbd834ef9ca57e1b6a91d043c2@localhost>
 <20160115145153.39e486e3@free-electrons.com>
Message-ID: <56993229.5060606@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni wrote:
> Alexander,
>
> On Fri, 15 Jan 2016 14:12:47 +0100, Alexander Dahl wrote:
>
>> If not already done, I would suggest to have those license stuff
>> compatible with SPDX [1]. I noticed license names in at least some
>> packages are not the same as the identifiers on
>> https://spdx.org/licenses/ ? so if someone wants to generate SPDX stuff
>> from a buildroot project, it maybe would be better to have a format for
>> names and delimiters which make it easier towards SPDX package data.
>
> We normally try to use the SPDX license code, at least for "new"
> licenses (i.e licenses for which we don't yet have a single Buildroot
> package under that license). However, for the first licenses (like GPL,
> LGPL, etc.), we have started using an encoding that is not the one from
> SPDX. I would personally be in favor to move to SPDX license codes
> everywhere, but that would break things for people that are currently
> parsing our license information. Is this reasonable to do nonetheless?

Changing our format to comply with SPDX would be a good idea IMHO. If
there's a well-defined and suitable standard out there it makes no
sense to define another one.

Obviously I understand this might be annoying to somebody. But we never
formally specified how "composite" licenses must be written and so,
strictly speaking, any parsing activity not based on a reliable ground.

-- 
Luca
