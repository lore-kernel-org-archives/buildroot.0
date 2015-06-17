From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 17 Jun 2015 08:52:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-06-16
In-Reply-To: <20150617063013.89DD7101A45@stock.ovh.net>
References: <20150617063013.89DD7101A45@stock.ovh.net>
Message-ID: <CABbD_XAA2LLjjPXCOfHR_3FSdc34uKKakMxMy3hO5ZeUiebJ8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

     openvmtools-stable-9.10.0 | 9
>
 ...

>       x86_64 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/bfd10c8d454a2686ebb1c4afdb49c55e39a9dd67/
>         i686 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/40dd552190852337bc3e8345bb3c6983fb982b40/
>       x86_64 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/824f44053f5d850af388fa53f9d36971c67f235a/
>       x86_64 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/4fdbc8e553fd25f01081dc1134b0fd498c4012bf/
>         i686 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/68e3e31a289fea36fc5913e882e70b04cb57b45d/
>       x86_64 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/94084c0e49b7fc5781fe271cbc9f10807a312dc8/
>         i686 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/ca8f2ea8d32a5fd0d3f7cf4923f694ed12268a79/
>         i686 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/7ff990866582d9e33ff42c467d5b45a7c6740225/
>       x86_64 |      openvmtools-stable-9.10.0 | NOK |
> http://autobuild.buildroot.net/results/94796956d262fcae35d662feedb3da52700d476b/


These failed because VMware decided to add another subdirectory in the repo
when moving to GitHub. I update the patches in BR right now, will send in
the fix today.

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150617/1a5e8c3b/attachment.html>
