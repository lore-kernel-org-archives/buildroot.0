From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 24 Oct 2007 08:45:57 +1000
Subject: [Buildroot] Busybox minicom-like application?
In-Reply-To: <471E53BA.5060401@promwad.com>
References: <6090c5eb0710231132k5146e947r48e3deeedc4b7599@mail.gmail.com>
	<471E5044.7020003@promwad.com>
	<6090c5eb0710231152r5cc500begf381537fad9efa0b@mail.gmail.com>
	<471E53BA.5060401@promwad.com>
Message-ID: <20071023224556.GA18766@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jorge S. wrote:
> Yes, i know its there, but it gets HIDDEN when i select the "[*] Hide
> applications that are provided by busybox".
> 
> Maybe there's a buildroot bug here?

busybox in SVN does have a microcom applet, as of four weeks ago. The
latest change to package/Config.in takes that into account.

On Tue, Oct 23, 2007 at 11:04:10PM +0300, Ivan Kuten wrote:
> Indeed,
> 
> see Config.in
> 
> if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
> source "package/microcom/Config.in"
> endif
> 
> see a typo.

Do you see a typo?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
