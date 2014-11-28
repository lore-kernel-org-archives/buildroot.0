From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Nov 2014 22:34:54 +0100
Subject: [Buildroot] buildroot 2014.11-rc3 mono fails
In-Reply-To: <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
References: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
 <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
Message-ID: <20141128223454.4a2cf327@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 28 Nov 2014 21:59:56 +0100, Angelo Compagnucci wrote:

> Probably you have a mono compiler installed on your machine and this
> mono compiler is not compatible with the latest mono version.
> 
> Mono uses the install wide mcs/gmcs compiler if it's present to
> compile itself,  also if not compatible.
> 
> Try to remove that mono compiler so mono cross compilation can use the
> internal one.
> If you are on Ubuntu/Debian you can remove mono-mcs package.

This is not an acceptable answer. Buildroot should be able to build
mono regardless of whether a mono compiler is installed on the machine
or not.

Could you work on a fix for this problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
