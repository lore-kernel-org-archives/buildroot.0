From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 15:07:01 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-09
In-Reply-To: <20141210073016.44F67101C84@stock.ovh.net>
References: <20141210073016.44F67101C84@stock.ovh.net>
Message-ID: <54886195.5080109@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-12-09

>       mipsel |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/f22888d87659dda8ff75f25490eab0a68f02bc9b/

Download problem? Patch sent to add a hash file:
  http://patchwork.ozlabs.org/patch/419551/

>       mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/55327fff5888392fce235b12f18e673b0f12a46f/

Reported upstream:
  http://lists.uclibc.org/pipermail/uclibc/2014-October/048699.html

>       mipsel |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/

Patch sent to fix the problem:
  http://patchwork.ozlabs.org/patch/419632/

>     mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/3dd700405055750262738f867eb5aa08531f5781/

Patch sent to fix the problem:
  http://patchwork.ozlabs.org/patch/419693/

>       mipsel |                lighttpd-1.4.35 | NOK | http://autobuild.buildroot.net/results/39c027bf6b76a0f9c15a184f449dadacfaefe980/

Already fixed by:

http://git.buildroot.net/buildroot/commit/?id=c77fbc3a4631b82bc28787c45a941ee0c47104ce

>     mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/b7861dadf6e9f21ee0341ecc3762693a44b6b3e9/

I can't reproduce this even using the same config file.

>       mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6735c7386c5f3300db072cf4b54a3696bc5b00af/

Building shared objects when doing static builds. Reported upstream:
  https://code.google.com/p/wvstreams/issues/detail?id=42

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
