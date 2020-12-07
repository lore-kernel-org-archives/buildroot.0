From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Dec 2020 23:33:44 +0100
Subject: [Buildroot] [PATCH 4/5] support/{config-fragments,
 testing}: select INET_RPC option for custom glibc external
 toolchains
In-Reply-To: <20201207225210.47944698@windsurf.home>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
 <20201207204821.3588178-4-romain.naour@gmail.com>
 <20201207225210.47944698@windsurf.home>
Message-ID: <eac3581f-928e-0f94-7987-b74bdb65a645@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 07/12/2020 ? 22:52, Thomas Petazzoni a ?crit?:
> On Mon,  7 Dec 2020 21:48:20 +0100
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> The sun rpc support has been removed from glibc 2.32 [1], so BR2_TOOLCHAIN_EXTERNAL_INET_RPC
>> will no longer be enabled by default for custom external toolchains.
> 
> Here you're saying "removed from glibc 2.32", but in a previous commit, you say:
> 
> """
> This special handling must be removed when all Bootlin toolchain has been
> rebuild with glibc > 2.32.
> """
> 
> I think this is somewhat confusing. Indeed, RPC has been removed from
> glibc 2.32, so your previous commit should have said:
> 
> """
> This special handling must be removed when all Bootlin toolchain has been
> rebuild with glibc >= 2.32.
> """

This is a typo, maybe ? :)

Nice catch!

Best regards,
Romain


> 
> Thomas
> 
