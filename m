From: Claudio Leonel <cls@elaxys.com.br>
Date: Thu, 21 Jun 2007 15:54:32 -0300
Subject: [Buildroot] Toolchain for  i386 with  floating point emulation
In-Reply-To: <1182166638.3576.20.camel@localhost>
References: <4673E35E.70905@elaxys.com.br>	
	<1182015829.13620.3.camel@localhost>
	<46754508.2020606@elaxys.com.br>	
	<1182092405.3642.20.camel@localhost>
	<46766463.8030504@elaxys.com.br>
	<1182166638.3576.20.camel@localhost>
Message-ID: <467AC968.1000004@elaxys.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

That's it, there is nothing to be done with the toolchain
or uClibc, we just need to configure the kernel to use math emulation !
The kernel will intercept the FPU instructions and
emulate them in software.

Thanks,

Claudio Leonel



Mats Erik Andersson wrote:
> Hi again!
> 
> Just a quick idea: In the kernel configuration there is an
> option for building floating point emulation when targeting
> to i386. Could you find some function name in that code in
> order to search for the corresponding part within uClibc?
> I will keep thinking!
> 
> Best regards          Mats E A
> 
