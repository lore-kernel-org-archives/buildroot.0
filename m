From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Sep 2012 16:12:32 +0200
Subject: [Buildroot] [PATCHv2 4/4] iw: pkg-config nitpicking
In-Reply-To: <5064D2BA.4050102@zacarias.com.ar>
References: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
 <1348656522-13698-4-git-send-email-gustavo@zacarias.com.ar>
 <5064C7E6.3080005@mind.be> <5064D2BA.4050102@zacarias.com.ar>
Message-ID: <20120928161232.0dd7a779@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 27 Sep 2012 19:27:06 -0300, Gustavo Zacarias wrote:
> On 09/27/12 18:40, Arnout Vandecappelle wrote:
> > Doesn't removing GIT_DIR break version.sh?
> 
> Oh yes it does on dirty, my bad for being to 'dd' happy.
> I'll resend the whole set once it's decided what to do about pkg-config.
> IMHO host-pkg-config can be killed with fire, no need to duplicate it.
> pkg-config might be deprecated as per the usual rite, though it's
> duplicate functionality and could be just killed being a piggy with glib
> deps :)

I agree that we don't need a deprecation period for pkg-config. It is
just an internal build dependency, nobody cares about it, especially if
there is a drop-in replacement for it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
