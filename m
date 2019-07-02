From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 2 Jul 2019 22:36:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-07-01
In-Reply-To: <5d1af309.1c69fb81.cf999.ba7eSMTPIN_ADDED_MISSING@mx.google.com>
References: <5d1af309.1c69fb81.cf999.ba7eSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <20190702203614.GA4840@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Hello,

> This is the list of Buildroot build failures that occured on
> 2019-07-01, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!

> Results for the 'master' branch
> ===============================

> Build failures related to your packages:

>          sh4 |               iputils-20190515 | http://autobuild.buildroot.net/results/e2ad49ca3b59c5d4b0fb883fc3a79483ba023428
> microblazeel |               iputils-20190515 | http://autobuild.buildroot.net/results/53c8354aba24ac99a532d3fc50132e4d5eeb1ff6
>         mips |               iputils-20190515 | http://autobuild.buildroot.net/results/cf3c2016be18882713a70baa367ef6836df207c1
>          sh4 |               iputils-20190515 | http://autobuild.buildroot.net/results/c891df50b2ca01c969e5275ca92d74ce861af8ee
>          arm |               iputils-20190515 | http://autobuild.buildroot.net/results/754179740a63d4c34480804f2b733f687a7128dd

At least some of these are fixed in next branch. What is the policy? Can be
individual commits cherrypicked? Or does it need to wait till next release?

Kind regards,
Petr
