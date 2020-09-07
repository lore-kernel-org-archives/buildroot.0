From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2020 23:24:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-09-03
In-Reply-To: <CAB0FRsuzue0h6G7-Y_zUZWxCvTS-qt9LOyM-DgJ2c1rLfekphA@mail.gmail.com>
References: <20200904070920.A74CC40135@themis.gorgu.net>
 <CAB0FRsuzue0h6G7-Y_zUZWxCvTS-qt9LOyM-DgJ2c1rLfekphA@mail.gmail.com>
Message-ID: <c8ae2391-a225-4129-343e-e74bd761dfec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/09/2020 11:32, Fran?ois Perrad wrote:
> 
> 
> Le?ven. 4 sept. 2020 ??09:09, Thomas Petazzoni <thomas.petazzoni@bootlin.com
> <mailto:thomas.petazzoni@bootlin.com>> a ?crit?:
> 
>     Hello,
> 
>     Autobuilder failures
>     ====================
> 
>     Below is a list of build failures reported by the Buildroot
>     autobuilders in relation to packages or CPU
>     architectures you are in charge of. Please help us
>     improving the quality of Buildroot by investigating
>     those build failures and sending patches to fix
>     them.Thanks!
> 
>     Results for the '2020.05.x' branch
>     ----------------------------------
> 
>     Build failures related to your packages:
> 
>     ? ? arch? ? ?|? ? ? ? ? ? ?reason? ? ? ? ? ? ?|? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
>     ? ? ? ? ?url? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
>     -------------+--------------------------------+---------------------------------------------------------------------------------
>     ? ?mipsel? ? |? ? ? ? luabitop-1.0.2-1? ? ? ? |
>     http://autobuild.buildroot.net/results/23f66439bb1d77cf6926eefba8defe847e27022f
>     ? ? mips? ? ?|? ? ? ? luabitop-1.0.2-1? ? ? ? |
>     http://autobuild.buildroot.net/results/390bcd6940a06d8a3c55e0ce6aad53882a511e6e
> 
> 
> This issue is fixed in master by the commit : package/prosody: luabitop is only
> needed with Lua 5.1
> https://git.busybox.net/buildroot/commit/package/prosody?id=8bd7239ca32f20102aad19dbb3ca647182edbf92

 If you want to signal a backport that is needed, please put Peter in Cc
otherwise he might miss it.

 Regards,
 Arnout

> 
> This issue was introduced with the commit : package/prosody: don't depend on
> !lua 5.3
> https://git.busybox.net/buildroot/commit/package/prosody?h=2020.05.x&id=98645393ed3611985e6703d1f5ee34eb1cd330ce
> because luabitop couldn't be build with Lua 5.3
> 
> Fran?ois
> 
> 
>     Results for the 'master' branch
>     -------------------------------
> 
>     Build failures related to your packages:
> 
>     ? ? arch? ? ?|? ? ? ? ? ? ?reason? ? ? ? ? ? ?|? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
>     ? ? ? ? ?url? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?
>     -------------+--------------------------------+---------------------------------------------------------------------------------
>     ? ? arm? ? ? |? ? ? ? ? luajit-2.1.2? ? ? ? ? |
>     http://autobuild.buildroot.net/results/5be7b15226f43d9154332c6305151fa4f7e43bd4
>     ? ? arm? ? ? |? ? ? ? ? luajit-2.1.2? ? ? ? ? |
>     http://autobuild.buildroot.net/results/ee1e40be6aee4f714d5a6f9c5fa31f4bffe01cc6
> 
> 
>     -- 
>     http://autobuild.buildroot.net
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
