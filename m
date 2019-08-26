From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Aug 2019 09:49:33 +0200
Subject: [Buildroot] New search features on autobuild.buildroot.org
In-Reply-To: <87h86b7lyi.fsf@dell.be.48ers.dk>
References: <20190820151106.4a1ffacf@windsurf.home>
 <87h86b7lyi.fsf@dell.be.48ers.dk>
Message-ID: <20190826094933.5c5f2b5d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 20 Aug 2019 20:04:05 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> One improvement could be to only pass the arguments if they have been
> filled in so you can ignore everything you don't care about rather than
> having to edit the URL afterwards.

Hm, this is exactly was it does, i.e if I do a search filtering only on
the architecture and one symbol, it redirects to the following URL:

  http://autobuild.buildroot.net/index.php?arch=arm&symbols%5BBR2_PACKAGE_STRACE%5D=y

This is all done by the submitForm() function in
http://autobuild.buildroot.net/search.js.

Could you confirm that it works for you (or not) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
