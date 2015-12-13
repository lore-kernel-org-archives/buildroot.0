From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:47:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: Needs threads
In-Reply-To: <1450031671-24884-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450031671-24884-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213224748.753b5345@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 19:34:31 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/fc0/fc02e01514965e13ee1de8f520a5b45f63a1103e/
> http://autobuild.buildroot.net/results/b9c/b9cb712b321de4528d1a8dfb9bdfb16190bb660a/
> http://autobuild.buildroot.net/results/22a/22aa0367ff76a3024faec69c762a08a4a441f45f/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

I agree with Yann, we could disable thread support in Mplayer, but who
wants a big thing like Mplayer on a non-threaded system anyway?

So: applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
