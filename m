From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Feb 2015 07:24:48 +0100
Subject: [Buildroot] python: host-python ssl support
In-Reply-To: <etPan.54e127c9.6b8b4567.29a8@MacBook-Pro-de-Jordi.local>
References: <etPan.54e127c9.6b8b4567.29a8@MacBook-Pro-de-Jordi.local>
Message-ID: <20150216072448.05f1148e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jordi Llonch,

On Mon, 16 Feb 2015 10:12:09 +1100, Jordi Llonch wrote:

> SSL support is explicitly disabled for host-python and needed by the
> latest pip to install from https. As per today, all the downloads
> from Python Package Index are https.
> 
> I saw in the list a patch from Rohan Fletcher
> implementing?BR2_HOST_PYTHON_SSL_SUPPORT and looks it was never
> merged.

I gave some feedback at:

http://lists.busybox.net/pipermail/buildroot/2013-July/075194.html

> Following the instructions in section 17.8 from Buildroot manual does
> not work for me. Am I doing something wrong? What is the correct
> strategy for building a python application with external dependencies?

Please tell us more about what's not working for you: post a patch
adding the package you're trying to create, and the corresponding error
messages you have, or issues you encounter. We can then try to help
diagnose the problems.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
