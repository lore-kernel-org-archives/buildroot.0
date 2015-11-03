From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 16:02:03 +0100
Subject: [Buildroot] Poco 1.6.1 with glib for Raspberry Pi
In-Reply-To: <5638CBAE.9040700@prosystems.de>
References: <56388339.6080904@prosystems.de>
 <20151103151918.1aa989ea@free-electrons.com>
 <5638CBAE.9040700@prosystems.de>
Message-ID: <20151103160203.187da1ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Benno,

On Tue, 3 Nov 2015 15:58:54 +0100, Benno wrote:

> > Can you give us a sample program that allows us to reproduce the
> > problem ?
> 
> I tried to make an example program...
> 
> #include <string>
> 
> int main(int argc, char **argv)
> {
>      std::string example = "This is a test string";
> 
>      return 0;
> }

Unless I'm wrong this example program is *not* using the Poco libraries.

> I linked the Poco libraries Foundation, Util and Net. Then I compiled it.
> When the linker is invoked I got the same errors again....

This is unclear. Can you give the *exact* commands you are running
using the example program above to get the problem ?

> > Is the sentence incomplete? "for the FPEnvironment" doesn't really mean
> > anything.
> I thought its an important info that I use glibc.

Yes, the fact that you use glibc is useful. But it does not answer my
question which was: "what do you mean by FPEnvironment?"

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
