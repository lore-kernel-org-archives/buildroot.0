From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 08 Sep 2011 13:03:00 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <1315476029.19139.4.camel@dublxciaranr1.verifone.com>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <201109061803.05970.arnout@mind.be> <4E673792.5040001@free-electrons.com>
 <201109071822.51608.arnout@mind.be> <4E687A46.1000705@free-electrons.com>
 <1315476029.19139.4.camel@dublxciaranr1.verifone.com>
Message-ID: <4E68A0E4.8080402@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let me add my two cents to this irresistible, brainstorming-like,
non-violent flamewar. :)

Quotient Remainder wrote:
>>> _FILE_INSTALL_TABLE.
>>
>> This one seems good to me. Peter ?
>
> They're all operations (create or change) on file-system entries so
> maybe like ..._EXTRA_FS_OPERATIONS or similar?

inodes_table?
nodes_table?
fsnodes_table?

Luca
