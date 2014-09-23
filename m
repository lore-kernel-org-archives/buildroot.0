From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 19:52:14 +0200
Subject: [Buildroot] [PATCH v7] canfestival: new package
In-Reply-To: <1411492000260-80004.post@n4.nabble.com>
References: <1404048539-14788-1-git-send-email-s.martin49@gmail.com>
 <1411492000260-80004.post@n4.nabble.com>
Message-ID: <20140923195214.790a2920@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear claurita,

On Tue, 23 Sep 2014 10:06:40 -0700 (PDT), claurita wrote:

> I'd like to propose a little patch to add pkg-config support.
> It's only a draft proposal, even if I'm using it. I hope it could be useful.

Thanks. But your patch is against canfestival itself, while you're
posting to the Buildroot mailing list. So you have two choices here:

 */ Submit your patch to the canfestival project directly.

 */ Add your patch inside Buildroot, in package/canfestival/, and then
    post a Buildroot patch adding your patch (yes, you'll have a patch
    adding a patch!)

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
