From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Oct 2010 08:44:39 +0200
Subject: [Buildroot] fakeroot fails to compile using crosstools-ng
 toolchain
In-Reply-To: <4CACF604.4080403@daccii.it>
References: <4CACF604.4080403@daccii.it>
Message-ID: <20101007084439.31bb8f52@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 07 Oct 2010 00:19:48 +0200
Daniele Salvatore Albano - Lavoro <info@daccii.it> wrote:

> i got a strange error, related to largefile support i think, when i 
> compile fakeroot. Large file support is enabled either on
> crosstools-ng and either on buildroot.
> 
> Everything else compiled fine (i got an error related to gdb host 
> package related to a symlink and an error with dnsmask related to 
> libidn, but these aren't related to the fakeroot problem)
> 
> Here i posted the fakeroot compilation log
> http://pastebin.com/8i8CbdMu

Yes, this is an issue that occurs when fakeroot is compiled for the
target. Obviously, it should be fixed, but in general, people do not
need fakeroot on the target, but only on the host.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
