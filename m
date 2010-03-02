From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Mar 2010 12:07:01 +0100
Subject: [Buildroot] add application for an ARM
In-Reply-To: <SNT129-W1349076A4FA2B477A273AFB93B0@phx.gbl>
References: <SNT129-W1349076A4FA2B477A273AFB93B0@phx.gbl>
Message-ID: <20100302120701.34cd5fcc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tony,

On Tue, 2 Mar 2010 11:51:34 +0100
Tony Mozi <spooflinux@hotmail.fr> wrote:

> Currently, I do the cross-compilation of linux for an ARM.
> Well, I create some .exe like 'hello', ... and I need to do './hello'
> to execute it. It is not the problem. I want to use the power of the
> ARM, like a Timer but I have no idea how to do. For example, I want
> to use a Timer in order to flash a Led. Have you got an idea? a
> documentation?? a readme? BR 

Sorry, but this question is out-of-topic on the Buildroot mailing list.
I'll give some answers, but please use other lists or forums for this
type of questions.

However, you may want to have a look at the documentation of the C
library, that you can use in your applications. See
<http://www.gnu.org/software/libc/manual/html_node/index.html> for the
reference documentation. For an introduction, I'd suggest to buy some
"Linux system programming" book.

Concerning the LED, if your LED is properly supported by the kernel, it
has a corresponding directory in sysfs.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
