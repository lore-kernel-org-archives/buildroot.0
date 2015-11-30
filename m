From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Nov 2015 18:29:58 -0300
Subject: [Buildroot] [PATCH 1/1] package/php: Always link with
 libpthread for static builds
In-Reply-To: <1448805351-17846-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448805351-17846-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <565CBFD6.5000500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/15 10:55, Bernd Kuhls wrote:

> Fixes
> http://autobuild.buildroot.net/results/c9f/c9fb2b4a25817d6455472767819018a62281d5f9/
> http://autobuild.buildroot.net/results/a75/a757edcfce00d3e52c6787f28dc31cbaf8d2d2ab/
> http://autobuild.buildroot.net/results/8df/8df836b6c241954449544c7b4c74a1cb19e7ff7b/
> http://autobuild.buildroot.net/results/1b6/1b6e571e307c2b190116601bade382c43e8d3858/
> http://autobuild.buildroot.net/results/aa3/aa34b2326a0702093162eb1f9d7bdf9c7cf45311/
> http://autobuild.buildroot.net/results/74a/74ae21d78f7ea9d71407accd3e43900af6766e68/
> http://autobuild.buildroot.net/results/7ec/7ec28c23b3f12e5b7e2376c7913329d2a38dd232/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Hi.
I'm not overly happy about this, however given that php's build system 
is a mess with many duplicate (or more) tests and bad assumptions...

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
