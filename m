From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 09:54:10 +0100
Subject: [Buildroot] [PATCH v3 3/4] python-cheetah: add host-package
 support
In-Reply-To: <20150305094049.055a39b7@x230.trabucayre.com>
References: <1425484811-26238-1-git-send-email-gwenj@trabucayre.com>
 <1425484811-26238-3-git-send-email-gwenj@trabucayre.com>
 <20150304224940.69efc51c@free-electrons.com>
 <20150305094049.055a39b7@x230.trabucayre.com>
Message-ID: <20150305095410.612bea91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Mar 2015 09:40:49 +0100, gwenhael.goavec wrote:

> I'm wrong, it's true, host-python-markdown is only needed for
> host-python-cheetah. I think the best solution is the second option, ie.
> PYTHON_CHEETAH_DEPENDENCIES = python-markdown to be sure to have the correct
> dependency in all case (although python-cheetah as not really needed to
> python-markdown to be compiles).

If only host-python-markdown is needed to build host-python-cheetah,
then the correct solution is:

HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
