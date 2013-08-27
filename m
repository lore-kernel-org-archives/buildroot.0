From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 16:29:34 +0200
Subject: [Buildroot] [1/1] civetweb: new package
In-Reply-To: <CAAXf6LX52MBd8Lrp4eho=Vkdo=QVyZ4=aytMJu3dY6w0EwoJkA@mail.gmail.com>
References: <CAG3-AMr2_Aj+Xv0A13fWawcDTUToCnt72LWyzwTLVKK+4m+++w@mail.gmail.com>
 <CAAXf6LX52MBd8Lrp4eho=Vkdo=QVyZ4=aytMJu3dY6w0EwoJkA@mail.gmail.com>
Message-ID: <20130827162934.3f2a4333@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Thomas,

On Tue, 27 Aug 2013 16:27:39 +0200, Thomas De Schampheleire wrote:

> > +$(eval $(generic-package))
> > \ No newline at end of file
> 
> There is no newline at the end of your .mk file, this should be fixed too.

And also generally speaking, the patch should be sent using 'git
send-email', because HTML formatted patches that are line wrapped are
not really practical to be applied on Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
