From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 16:10:42 +0100
Subject: [Buildroot] [PATCH 2/2] soletta: new package
In-Reply-To: <CAPi7W80AjNfZOniKchD1MNULFyiwKNDrxNB5bbCtwy9Nx=995w@mail.gmail.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
 <1477419935-86355-2-git-send-email-fabrice.fontaine@orange.com>
 <20161217235236.06cc45a2@free-electrons.com>
 <CAPi7W81=a+pP_3X3yfg=uZ+65SDpvpVy3M_2wwAFVchfLSFHCA@mail.gmail.com>
 <20161218111637.7f152e12@free-electrons.com>
 <CAPi7W80AjNfZOniKchD1MNULFyiwKNDrxNB5bbCtwy9Nx=995w@mail.gmail.com>
Message-ID: <20161218161042.2e2f9975@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 15:40:09 +0100, Fabrice Fontaine wrote:

> I tried to migrate the python3 scripts to python2 but I will stop. There is
> too many impacts which will not be easily upstreamable (shutil.which must
> replaced by shutilwhich backport, access to tuple attributes is allowed
> only through integers, f.write takes only one argument, configparser has to
> be replaced by ConfigParser which does not support reading configuration
> from a string, ...)

OK, so please keep your original solution then. It's a bit nasty as it
adds python3 to the target (which we don't need), but I don't really see
how do it differently for the moment.

I think it's something we should write as a topic to discuss for the
next Buildroot Developers meeting at FOSDEM.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
