From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 09:32:40 +0100
Subject: [Buildroot] Kconfig warnings with GCC9
In-Reply-To: <CAGt4E5u+KA3Vi0dp+YRAYnvXSJN1XXF=S86Th4NoyamnQSWpiw@mail.gmail.com>
 (Markus Mayer's message of "Fri, 10 Jan 2020 14:35:37 -0800")
References: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
 <20200110215652.291df299@windsurf>
 <CAGt4E5u+KA3Vi0dp+YRAYnvXSJN1XXF=S86Th4NoyamnQSWpiw@mail.gmail.com>
Message-ID: <87a76ujsuv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

 > On Fri, 10 Jan 2020 at 12:56, Thomas Petazzoni
 > <thomas.petazzoni@bootlin.com> wrote:
 >> 
 >> Hello,
 >> 
 >> On Fri, 10 Jan 2020 11:17:47 -0800
 >> Markus Mayer <mmayer@broadcom.com> wrote:
 >> 
 >> > Hi all,
 >> >
 >> > Using GCC9 (Ubuntu 19.10), I am getting some compiler warnings
 >> > (potential buffer overruns) in the Kconfig code. Is this a known
 >> > issue?
 >> 
 >> You can try to update the kconfig code in Buildroot with the kconfig
 >> code available from the latest kernel, and see if it fixes the
 >> warnings. We're currently using the kconfig code from 4.17-rc2 it seems.

 > I'll give it a shot.

Before doing that, try running make menuconfig with a recent Linux
kernel to check if those warnings are no longer triggered.

-- 
Bye, Peter Korsgaard
