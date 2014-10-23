From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 23 Oct 2014 14:08:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-22
In-Reply-To: <20141023063017.0B8391011FF@stock.ovh.net>
References: <20141023063017.0B8391011FF@stock.ovh.net>
Message-ID: <CAHkwnC84N+Lp9yZh6Rci+-MWPuRf+zgAjdom_LU2cFrRYwgGjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 23, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>          arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/e2c0bccb854ea7736ed81ce9071dfb8700148da9/
>          arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/40030b5b210fe0cca547136a34e9f2a8ddd27bc1/
>          arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/c66c3ba8f7b912d584f72f71283ebe9b3b6ec628/
>          arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/f4ce3665b8953b52433627c2e743f7c3c4d9423e/
>         i486 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/eabda08e4b1343aaef039198d8695ca5e12e1650/
>         sh4a |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/4eecb13a1479f3d175ef1fece9569e647066a20f/

Hi Francois,
Reverting your commit fix those build failures.

commit 8e716d659b08635bba703d9ae0867d8590f6b083
Author: Francois Perrad <fperrad@gmail.com>
Date:   Sat Oct 11 08:36:42 2014 +0200
    libxml-parser-perl: restore it like before perl infra

What do you think about it?

BR
--
Fabio Porcedda
