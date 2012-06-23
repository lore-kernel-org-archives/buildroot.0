From: Richard Braun <rbraun@sceen.net>
Date: Sat, 23 Jun 2012 11:57:04 +0200
Subject: [Buildroot] modify kernel source code
In-Reply-To: <CAFC29aWY59_7+WhjEGx9_3BJm10dCNrj8rkUPSG1LbqfgU+n0g@mail.gmail.com>
References: <CAFC29aWY59_7+WhjEGx9_3BJm10dCNrj8rkUPSG1LbqfgU+n0g@mail.gmail.com>
Message-ID: <20120623095704.GA22422@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2012 at 05:22:24PM -0700, Ron Eggler wrote:
> I want to modify the kernel source code after it's been downloaded
> according to these instructions in order to get a driver for my Novatel
> MC679 compiled. How can I interrupt the buildroot process once the kernel
> sources have been downloaded or how else can I/should I do this?
> 
> Thank you for any suggestions!

See the BR2_LINUX_KERNEL_PATCH configuration parameter.

-- 
Richard Braun
