From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 14:52:12 +0200
Subject: [Buildroot] Using Buildroot tool chain as external Toolchain
In-Reply-To: <1368535813.2434.51.camel@john-ubu>
References: <1368522484.2434.45.camel@john-ubu> <20130514112516.7ed42f44@skate>
 <1368525117.2434.50.camel@john-ubu> <20130514115449.34d3cc76@skate>
 <1368535813.2434.51.camel@john-ubu>
Message-ID: <20130514145212.6c116114@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear john,

On Tue, 14 May 2013 13:50:13 +0100, john wrote:

> Thanks Thomas,
> 
> That fixed my problem, I appreciate your help

Ok, good.

Perhaps I should submit this patch. I don't think there's any other
solution than this one, since the $ORIGIN/../lib trick cannot work.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
