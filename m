From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 20 Sep 2015 10:26:42 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-19
In-Reply-To: <20150920063017.5E1E6101C6F@stock.ovh.net>
References: <20150920063017.5E1E6101C6F@stock.ovh.net>
Message-ID: <38121FAB319C3344930C920E7B51831325FCF95A@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 20/09/15 07:30, Thomas Petazzoni wrote:
> Build statistics for 2015-09-19
> ===============================

>      mips64el |               host-cmake-3.3.2 | NOK | http://autobuild.buildroot.net/results/2bd81e2ecb09e64ccf9e5c35f1160a9b9e7bd079/

I cannot reproduce this one.

>      mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/d21bdc389597d5f76c955b8e169c4eb30d596bc8/

Pull request sent:

https://github.com/micropython/micropython/pull/1471

>      mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/a941a0fa6345309f3255556af652b417c7c46796/
>      mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/b2766b10b18070407f305728ad776588ac06630e/
>      mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/1ff9269b41463d288c16d5b21529234757929eca/

Fixed by:

https://patchwork.ozlabs.org/patch/519976/

Regards,

Vincent.
