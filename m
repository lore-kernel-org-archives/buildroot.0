From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 18:48:58 +0200
Subject: [Buildroot] problem while installing uImage
In-Reply-To: <CAL-BCze5gR9YBDXWZURiOXJ5x1UnD1=AFCvCh2O63v85QmCrNQ@mail.gmail.com>
References: <CAL-BCze5gR9YBDXWZURiOXJ5x1UnD1=AFCvCh2O63v85QmCrNQ@mail.gmail.com>
Message-ID: <20140609184858.52da6d0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Digesh Patel,

On Mon, 9 Jun 2014 22:04:53 +0530, Digesh Patel wrote:

>  i am getting problem with buildroot created uImage when i am installing it
> to the mpc8313erdb powerpc board. i enabled all things which i needed by
> giving 'make menuconfig' after that i cross compiled with the builroot
> created toolchain.uImage was created.it is installing properly but at the
> booting time it is giving error.
> Can any one suggest me what is the problem? is it buildroot problem ?
> i am using buildroot 2014.02 and linux kernel is v3.0

Please provide:

 1/ Your complete boot log, including the U-Boot environment (i.e the
    output of the "printenv" command in U-Boot).

 2/ Your complete Buildroot .config file.

Without these details, it is impossible to help you, you're not giving
enough informations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
