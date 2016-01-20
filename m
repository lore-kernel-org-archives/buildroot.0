From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 13:55:31 +0100
Subject: [Buildroot] Browser in kiosk mode
In-Reply-To: <569F7F6A.4060906@gmail.com>
References: <569F7F6A.4060906@gmail.com>
Message-ID: <20160120135531.6b254234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marco,

On Wed, 20 Jan 2016 13:36:58 +0100, Marco Trapanese wrote:
> Hi, I'm asking some hints about which is the best solution in buildroot 
> to have a browser in kiosk mode with a whitelist.
> I mean, a full-screen browser, with no way to change the settings, and a 
> list of allowable addresses.
> 
> Firefox has a couple of plugins to achieve that but it's not included 
> (yet?) in buildroot. I found this:
> 
> http://lists.busybox.net/pipermail/buildroot/2012-September/058314.html
> 
> I guess it won't be included soon, because the patches are there since 
> 2012. Anyway I will try to use them on the latest version.
> 
> Do you recommend other packages already provided in the current 
> buildroot version which I could use?

We have a package called qt-webkit-kiosk, maybe this would match what
you are looking for?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
