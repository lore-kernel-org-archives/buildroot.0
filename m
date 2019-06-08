From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 9 Jun 2019 00:17:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/libevent: fix build with openssl
In-Reply-To: <20190608215756.30417-1-fontaine.fabrice@gmail.com>
References: <20190608215756.30417-1-fontaine.fabrice@gmail.com>
Message-ID: <18d7c1dd-3b32-7577-175c-792c08404865@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 08/06/2019 ? 23:57, Fabrice Fontaine a ?crit?:
> Since bump to version 2.1.10 in commit
> 3c8e79db8375f83a8e6a1d58ade697447903b6b0, openssl detection is broken.
> Add a patch to fix it otherwise libwebsock fails to build

Indeed.
I had not tested openssl configuration after bump to version 2.1.10.

Thanks for the fix.

> 
> Fixes:
>   -http://autobuild.buildroot.org/results/be32afa364a6b387195cdb5166fb23e9610451a7
> 
> Signed-off-by: Fabrice Fontaine<fontaine.fabrice@gmail.com>
> ---

Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>

-- 
Best regards,
Pierre-Jean Texier
