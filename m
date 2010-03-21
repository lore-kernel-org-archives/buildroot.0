From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Mar 2010 08:51:19 +0100
Subject: [Buildroot] [Bug 1351] host-libxslt-1.1.24 fails to build
In-Reply-To: <4BA59B5A.6090701@iwtech.com.au>
References: <bug-1351-163@https.bugs.busybox.net/>
	<20100318090204.A0E7D77515@busybox.osuosl.org>
	<4BA59B5A.6090701@iwtech.com.au>
Message-ID: <20100321085119.3d9104eb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Mar 2010 15:06:50 +1100
Paul Jones <paul.jones@iwtech.com.au> wrote:

> How do I get a build log?
> make > buildlog.txt ?

I usually do something like:

 make 2>&1 | tee build.log

The problem with "make > buildlog.txt" is that error messages will not
be sent to your log file.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
