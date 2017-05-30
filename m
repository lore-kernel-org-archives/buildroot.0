From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:44:22 +0200
Subject: [Buildroot] Makefile: add check of binaries architecture
In-Reply-To: <CABLXdK_3=64R13wD+_WN7DceLiLtwEy2Hg8Rtqdd_p6Xu4tXEg@mail.gmail.com>
References: <CABLXdK_3=64R13wD+_WN7DceLiLtwEy2Hg8Rtqdd_p6Xu4tXEg@mail.gmail.com>
Message-ID: <20170530234422.23923aef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 23:35:35 +0200, Ricardo Herrero wrote:

>  I have been compiling some packages both ARM and linux-x86_64 archs
> together until I have tested with Buildroot 2017.05_rc2. It adds a check
> for proper binaries during build stage. But I need to build both archs. So
> I need to know if there is a way to bypass this check or if I can do
> something else. My problem is that I need a package to compile both x86_64
> and arm in order to compile another package  both in x86_64. So I cannot
> remove x86_64 folders right after build, I need all of them until install
> phase.

Can you explain your use case in more detail? I don't understand why
you are mixing ARM and x86-64 binaries in the target folder. So before
proposing a solution to workaround the architecture check, I'd like to
make sure that there isn't a deeper problem in the approach you're
using to build those packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
