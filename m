From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 26 Jun 2015 08:23:49 -0500
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <20150625223823.GI4178@free.fr>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be> <20150625085428.GA3400@arthur-dreem>
 <558C800F.5030702@mind.be> <20150625223823.GI4178@free.fr>
Message-ID: <CAMQcK5JBCq4Dro8o-6n2O=YKeSzvv3Eb07FT+=iKfvsv-sB3zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, Jun 25, 2015 at 5:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, Arthur, All,
>
> One case where I'd be inclined to accept more than the above is a
> full-wireless device (like the soon-to-come-I-hope 96boards stuff).
> But since wpa-supplicant needs configuration that we can't provide
> (SSID and key), I don't see the point of adding it to the defconfig.
>
> However, we've decided to accept "demo" defconfigs, which can be packed
> with more features than a simple board defconfig. We haven't had any
> single such demo defconfig submitted so far.
>
> Still, even if we accept demo defconfigs, I stil think we should have a
> small board defconfig file before we get a demo.

For the SELinux patchset, we are submitting a demo configuration
because of the complexities of enabling SELinux packages.

http://patchwork.ozlabs.org/patch/479484/

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
