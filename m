From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 23 Apr 2018 18:14:02 +0200
Subject: [Buildroot] [PATCH v6 0/4] llvm for mesa3d
In-Reply-To: <20180411161452.25043-1-valentin.korenblit@smile.fr>
References: <20180411161452.25043-1-valentin.korenblit@smile.fr>
Message-ID: <9bbfe5da-723f-f0ce-6894-e277e6d7bd77@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 11/04/2018 ? 18:14, Valentin Korenblit a ?crit?:
> Hello all,
> 
[...]
> 
> 
> Valentin Korenblit (4):
>   package/clang: new package
>   package/libclc: new package
>   package/mesa3d: enable OpenCL support
>   package/clinfo: new package

The next 2018.05-rc1 is near, it would be great if the remaining patches from
llvm/clang series can be reviewed or merged :)

I know there are some annoying issues with dl cache infra and a lot of patches
to review but the llvm/clang series should be ok for 2018.05.

Best regards,
Romain
