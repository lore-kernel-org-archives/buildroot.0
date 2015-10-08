From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 8 Oct 2015 11:08:40 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain: add sparc64 architecture
 support
In-Reply-To: <20150829101136.02a50aec@free-electrons.com>
References: <20150811203709.GA9885@waldemar-brodkorb.de>
 <20150828202224.2f12a93c@free-electrons.com>
 <20150829074104.GB8475@waldemar-brodkorb.de>
 <20150829101136.02a50aec@free-electrons.com>
Message-ID: <561678E8.7020806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/08/15 05:11, Thomas Petazzoni wrote:

> So maybe the option should be called v9a, rather than just v9 ? Or just
> Ultrasparc so it matches the name of the gcc -mcpu option ?

Hi.
ultrasparc (1) is the lowest common denominator/implementation.
I'm unsure if it adds anything to the base v9 ISA spec (i think not), 
but you'd be hard-pressed to find any other more basic implementation if 
it does, maybe one of the MCST/Elbrus implementations that are 
impossible to obtain.
Regards.
