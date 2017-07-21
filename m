From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:26:26 +0200
Subject: [Buildroot] img layout
In-Reply-To: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
References: <trinity-526790e5-6239-4ac3-8df7-331d1a974560-1500619716190@3capp-mailcom-bs08>
Message-ID: <20170721092626.57bf9db2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 08:48:36 +0200, daggs wrote:

> I have a question about the image layout, if I dd some data into a
> final image, can I extrapolate what pre image creation file it
> touches and at what offset?

Not easily at all, as it depends on the filesystem and its internal
structure.

The big question is why you would want to do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
