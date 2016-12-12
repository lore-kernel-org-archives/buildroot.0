From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 12:06:02 +0100
Subject: [Buildroot] Using 2016.11-rc2: external packages and
 BR2_EXTERNAL ?
In-Reply-To: <23ce01d25454$c528d7e0$4f7a87a0$@chordia.co.uk>
References: <23ce01d25454$c528d7e0$4f7a87a0$@chordia.co.uk>
Message-ID: <20161212120602.3f16376b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 08:50:20 -0000, jerry at chordia.co.uk wrote:

> What is the best way to ensure $BR2_EXTERNAL is available at the configure
> stage?

With the support for multi-br2-external in 2016.11, things have changed
a bit, and BR2_EXTERNAL no longer exists. It's name
BR2_EXTERNAL_<name_of_your_external>.

See the CHANGES file in Buildroot:

        It is now possible to specify multiple BR2_EXTERNAL
        directories. The required files in a BR2_EXTERNAL directory
        have changed to accomodate this feature. Refer to the
        documentation for details of how to update them. External
        trees now have a name and a description. Also, it is possible
        to override a defconfig in the external tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
