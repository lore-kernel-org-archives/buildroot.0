From: =?UTF-8?Q?Micka=c3=abl_Tansorier?= <mickael.tansorier@smile.fr>
Date: Thu, 24 Oct 2019 14:08:07 +0200
Subject: [Buildroot] [PATCH V2] dejavu: Add missing license name and
 license hash
In-Reply-To: <20190724002514.2e252e64@windsurf>
References: <20190723152816.20465-1-mickael.tansorier@smile.fr>
 <20190724002514.2e252e64@windsurf>
Message-ID: <5f0874be-4211-468a-2ef0-cba28a84aefe@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 24/07/2019 ? 00:25, Thomas Petazzoni a ?crit?:
> Hello,
Hello,
> 
> Adding Yann and Arnout (licensing question below)
> 
> On Tue, 23 Jul 2019 17:28:16 +0200
> Micka?l Tansorier <mickael.tansorier@smile.fr> wrote:
> 
>> There is 3 licenses, not listed in SPDX license list:
>> - Bitstream Vera Fonts
>> - Arev Fonts
>> - Public Domain
> 
> I'm not sure what you mean in this commit log. The actual code change
> is to add "Bitstream Vera" to the list of licenses, which is also not
> part of the SPDX license list.
> 
> Regarding SPDX and "Public Domain", see
> https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files.
> 
> Also, I think you are misreading the LICENSE file. What it says is
> "Bitstream Vera Fonts Copyright" and "Arev Fonts Copyright", which are
> not license texts. The license text is below each of those titles.
> 
> Here is what Debian says about this font:
> https://metadata.ftp-master.debian.org/changelogs//main/f/fonts-dejavu/fonts-dejavu_2.37-1_copyright
> 
> Thomas
> 
I revival this subject.
It is not clear for me which license is right. Have you any idea to
correct my patch ?
Thank you.

-- 
Tansorier Micka?l

Smile ECS / OpenWide Ing?nierie
D?l?gu? du Personnel pour l'agence de Nantes

[Pr?serve ta libert?: https://gafam.laquadrature.net/]
[L'Ortographe de moli?re: https://www.invidio.us/watch?v=5YO7Vg1ByA8]
