From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jan 2016 22:02:03 +0100
Subject: [Buildroot] [PATCH 1/2] python3: switch to Git formatted patches
In-Reply-To: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 4 Jan 2016 19:23:28 +0100")
References: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8737udjbxw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In preparation for the bump to Python 3.5.0, let's switch all the
 > patches to the Git format. This way, a Git repository of the Python
 > source code can be used to manage those patches, which makes it easier
 > to bump to newer Python versions.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

[snip]

>  delete mode 100644 package/python3/006-cross-compile-getaddrinfo.patch

Did you drop this patch on purpose?

-- 
Bye, Peter Korsgaard
