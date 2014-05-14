From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 May 2014 09:23:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-13
In-Reply-To: <20140514063007.573B7100D85@stock.ovh.net>
References: <20140514063007.573B7100D85@stock.ovh.net>
Message-ID: <20140514092344.39ccdc76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Wow, only 8 build failures yesterday. Let's have a look at them.

On Wed, 14 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:

>       bfin | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/a4ec0e9f28cd12ce770718fb407bbb4dc93b528b/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=190b4e12b7ea2de783cf7ed54fa2207f45d66fa5.

>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/827b487b219eda8c86d85041e2ceac983bcf5dd7/

Still unresolved at this point.

> microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/690a83eccd5b4eab8bf431bb4e02ccb79592a0d9/

Still unresolved.

>        arm | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/913bb1836076be9f201bf6641c7614708d6916bc/

Caused by host-python3. I've sent a mail to Samuel so that he can have
a look into this.

>        arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/e1b330abfa2d80f3f30bc3359428ea429c690eb8/

Fixed by http://patchwork.ozlabs.org/patch/348533/.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/5a29077e6c8ab1ed14167ab20324dbb6131758ee/
>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/cb4e5347781e9a78b2ac0ff191c8f0f0120348c9/

Fixed by adding exceptions in the autobuilder scripts.

>       sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7e9f13a4bf3e8e68dceca7a8d5b6b5f4bbebe667/

Still unresolved.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
