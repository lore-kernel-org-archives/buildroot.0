From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:48:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-20
In-Reply-To: <20180821204549.GA26988@ned>
References: <20180821060020.69804207B3@mail.bootlin.com>
 <20180821204549.GA26988@ned>
Message-ID: <20180821224856.2bcb02a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 22:45:50 +0200, Eric Le Bihan wrote:
> Hi!
> 
> On 18-08-21 08:00:20, Thomas Petazzoni wrote:
> >
> >          arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/636da0febe02f991095965d52cc4a8b2da644777 |
> >      powerpc |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/e6aa3d98203d3ac1788671bda3041b2563e5a411 |
> >          arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/af709ccc027b0a9bea0228001572084c19d4c710 |
> >          arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/12af6e626c1ad4b5c9f4c612b64027213923c4d7 |
> >        nios2 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/9b837f60cbd15e2a3c11e3453e543ca27ec28498 |
> >          arc |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/78f4ec7d8bbb94aa5ea1bcc91a56aad664ab8835 |
> >         i686 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/ded8c3a72e97c6e7481062ff601f1f03adab6976 |  
> 
> This looks like an issue with setuptools and Python 3.7, as reported
> here [1].
> 
> From [2], setuptools v38.4.0 is used, the latest is v40.2.0, but v38.4.1
> should do the trick [3,4].

This issue is already fixed:

  https://git.buildroot.org/buildroot/commit/?h=next&id=eb9d0e38101d3f62096550e0a39dbd18932ccc87

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
