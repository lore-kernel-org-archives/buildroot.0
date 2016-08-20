From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 19:59:51 +0200
Subject: [Buildroot] pointer dereference to incomplete type
 vm_operations_struct
In-Reply-To: <CAK7rcp9RQO8gfsqc6SAyFpn=kK19iRrS=ckYvnSWJuutc_SE3g@mail.gmail.com>
References: <CAK7rcp9RQO8gfsqc6SAyFpn=kK19iRrS=ckYvnSWJuutc_SE3g@mail.gmail.com>
Message-ID: <20160820195951.61167f14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 13:03:09 -0400, Kenneth Adam Miller wrote:

> I'm trying to compile a small linux, and I'm getting an error
> sometimes with vm_operations_struct as per the email title. Is there
> some kernel option that I'm missing or forgetting to enable? I did a
> make clean and was sure to delete my build and target directories. But
> I still get that error. Is there some option that I'm missing that
> must be set?

Please be more specific:

 - Which kernel version you're using.
 - Which kernel configuration you're using.
 - Which exact error message you're getting.

However, most likely the issue you're seeing is not Buildroot related,
but kernel related.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
