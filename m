From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 14:03:47 +0200
Subject: [Buildroot] Buildroot Mono Compile fails on mscorlib
In-Reply-To: <D1C2DD1B.197E2%r.salomons@ropesolutions.nl>
References: <1436336880640-104945.post@n4.nabble.com>
 <20150708135209.18da05f9@free-electrons.com>
 <D1C2DD1B.197E2%r.salomons@ropesolutions.nl>
Message-ID: <20150708140347.223be2e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Jul 2015 04:38:06 -0700 (PDT), salorob wrote:

> Well, the post was created online, for some reason it didn't email the bits between the <raw> tags.
> 
> I'll try the packages from the original repository first, and will get back with that.

Yes, please try the official Buildroot, and if you get a build failure,
make sure to include in your report: 1/ the exact Buildroot version you
have used and 2/ a minimal Buildroot .config file that exhibits the
issue so that we can easily reproduce.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
