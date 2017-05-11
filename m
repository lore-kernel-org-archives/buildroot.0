From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 17:49:33 +0200
Subject: [Buildroot] Problems building iotop
In-Reply-To: <CA+12NB+dzKMw2x=mBESq+Ti0COMiQmbHTiRaO=E35xOZch+4gw@mail.gmail.com>
References: <CA+12NB+dzKMw2x=mBESq+Ti0COMiQmbHTiRaO=E35xOZch+4gw@mail.gmail.com>
Message-ID: <20170511174933.28030e0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 11:45:59 -0400, Linux User wrote:

> I am getting,
> 
> make iotop
> make: *** No rule to make target `iotop'.  Stop.

Most likely you haven't created a Buildroot configuration.

Have you run "make menuconfig", define the Linux system you want to
build, and then run "make" ?

If not, then please read some documentation about Buildroot :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
