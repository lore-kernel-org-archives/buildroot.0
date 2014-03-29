From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:20:48 +0100
Subject: [Buildroot] rsync fails to build
In-Reply-To: <5CA29710B49644AAA294F0FD9984A1D8@JohanW7>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
 <20140329143057.6e6aa65a@skate>
 <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
 <20140329180038.7acf5143@skate>
 <5CA29710B49644AAA294F0FD9984A1D8@JohanW7>
Message-ID: <20140329232048.45ced2b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sat, 29 Mar 2014 23:11:30 +0100, Sagaert Johan wrote:

> The pasted text is here :
> http://code.bulix.org/i9z88z-85936?raw
> 
> Using gcc 4.8.x  did not solve it.

Can you retry after disabling ccache ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
