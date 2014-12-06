From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Dec 2014 09:48:37 +0100
Subject: [Buildroot] [PATCH] package: add python-psutil
In-Reply-To: <20141205234732.1434230d@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 5 Dec 2014 23:47:32 +0100")
References: <1417596171-10284-1-git-send-email-peter@korsgaard.com>
 <20141205234732.1434230d@free-electrons.com>
Message-ID: <87a931w4d6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> create mode 100644 package/python-psutil/Config.in
 >> create mode 100644 package/python-psutil/python-psutil.hash
 >> create mode 100644 package/python-psutil/python-psutil.mk

 > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 >  (code reviewed, license checked, built and runtime tested on
 >  ARM/uClibc)

Thanks for the reviews!

 > Note however that the commit title for package additions should
 > normally be "<pkg>: new package", but it can be fixed while applying,
 > of course :-)

I don't think we have really formalized that, and looking at the git
history we do have a mix of 'package: add foo' and 'foo: new package' or
even 'foo: add new package' - But I'll change it when applying.

-- 
Venlig hilsen,
Peter Korsgaard 
