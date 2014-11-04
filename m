From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 4 Nov 2014 12:30:16 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-03
In-Reply-To: <20141104073015.4ACB510134B@stock.ovh.net>
References: <20141104073015.4ACB510134B@stock.ovh.net>
Message-ID: <5458C6D8.1010607@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-11-03

>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/0ac122872a95078bdd64163b6823aa66e6c350df/
>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/507cf49e31adf1f91c40443dd0fede283f73cafe/
>       mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/88939dbcf0a27dd97d7e297ea3c7f07f458a31e9/

This shouldn't be happening. The rt-tests package should be removed from
the build list for the toolchains used in those config files. The
builder who did those builds doesn't have an updated autobuild-run script.

ThomasP in CC.

>     mips64el |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/fece68a4cec43bce19f55a1a3e5eee1764e108ec/

To be investigated.

>         mips |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/4eb8482d2706cb692849b25e2672848099e6f27d/

Patches sent:
  http://patchwork.ozlabs.org/patch/406583/
  http://patchwork.ozlabs.org/patch/406584/

>     mips64el |                   taglib-1.9.1 | TIM | http://autobuild.buildroot.net/results/e2db46ad767c07ae51d4cd68baadde8f841c2ac0/

This seems to be a builder problem. It finished suddenly with no error
message.

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
