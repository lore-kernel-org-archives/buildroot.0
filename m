From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 May 2017 09:11:09 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-05-01
In-Reply-To: <20170502062817.7C03E207D4@mail.free-electrons.com>
References: <20170502062817.7C03E207D4@mail.free-electrons.com>
Message-ID: <CAOMZO5CG_H47Xcpo=eTF+K7Rm0YMd9XTjfvzwktrYrsCKULWgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 2, 2017 at 3:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-05-01, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          arm | atest-895b0183a89c15f5e2305... | http://autobuild.buildroot.net/results/24081a28132899e9853dcb33a345db55c7c9d04a

What about adding a "depends on BR2_USE_MMU" to  package/atest/Config.in?

Would this be the correct fix for this issue?
