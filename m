From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:11:47 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <b2eb7b3c-1205-a1c1-fdd2-bfb1bafcfa66@mind.be>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
 <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
 <20170403130149.6ccffe4e@free-electrons.com>
 <b2eb7b3c-1205-a1c1-fdd2-bfb1bafcfa66@mind.be>
Message-ID: <20170403141147.0376b102@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Apr 2017 13:25:11 +0200, Arnout Vandecappelle wrote:

>  Would the libintl from uClibc make it easier to do static linking, i.e. is it
> in libc or in a separate libintl library?

It is in libc I believe, since uClibc now has everything in libc. So it
does make things a *lot* easier for static linking.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
