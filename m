From: Ossy <ossy1980@gmx.net>
Date: Wed, 18 Aug 2010 23:34:06 +0200
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <20100813122600.3d227eb3@surf>
References: <201007272333.09640.PeterHuewe@gmx.de>
	<20100813122600.3d227eb3@surf>
Message-ID: <4C6C51CE.5020409@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.08.2010 12:26, schrieb Thomas Petazzoni:
> This is fixed in my for-2010.08 branch, the specific commit being
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.08&id=fee182d20d9b1876436c9673744ae6312a40e889.
>
> If you have the time to test this branch and report whether it also
> fixes the problem for you, it'd be nice.
Hi,

I applied this patch
http://git.buildroot.net/~tpetazzoni/git/buildroot/patch/?id=fee182d20d9b1876436c9673744ae6312a40e889
to the current git tree on my drive. This time I did not encounter a 
problem with host-lzo, but host-zlib ran into an error ("zlib.a not 
present"). After make flush with a consecutive make, the systembuild 
went on without problems.

I'm not sure if this is a problem "behind" host-lzo (which was solved by 
the former make flush for host-lzo) or a new problem caused by the patch 
fee182d20d9b1876436c9673744ae6312a40e889.

Regards,
Marcus
