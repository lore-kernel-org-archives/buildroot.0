From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 31 Mar 2014 02:36:43 +0200
Subject: [Buildroot] rsync fails to build
In-Reply-To: <20140329232048.45ced2b2@skate>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7><20140329143057.6e6aa65a@skate><9E4B04B54DB642238FDE42DB9E40DE73@JohanW7><20140329180038.7acf5143@skate><5CA29710B49644AAA294F0FD9984A1D8@JohanW7>
 <20140329232048.45ced2b2@skate>
Message-ID: <F9B5E559611E4C1580A5E85C9C0023A7@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Thomas 

Yes , I can confirm rsync builds with the ccache disabled.

I have kept the 2 rync build dirs in case they could be of any use.

As a sidenote :
nettle sometimes (1 on 20 ) throws a build error, and just starting make again without actually removing
its build directory just resumes the build without error.
It never gives an error when the ccache is off.

Regards, Johan

-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: zaterdag 29 maart 2014 23:21
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] rsync fails to build

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
Embedded Linux, Kernel and Android engineering http://free-electrons.com
