From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:24:38 +0100
Subject: [Buildroot] [git commit] toolchain: add link-time-optimization
 support
In-Reply-To: <54FB23E5.3050707@mind.be>
References: <20150307142749.E241880468@busybox.osuosl.org>
 <54FB23E5.3050707@mind.be>
Message-ID: <20150307172438.73f5a634@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 07 Mar 2015 17:14:29 +0100, Arnout Vandecappelle wrote:

>  Given that this new option (probably) changes how some packages are built, I
> think there should be a few autobuilder configs that enable it. Any volunteers
> to take care of that?

No: the commit only allows to enable LTO support in the compiler. It
does not start building packages with -flto, unless of course some
packages automatically detect the availability of the LTO feature in
the compiler and make use of it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
