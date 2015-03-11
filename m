From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 09:34:04 +0100
Subject: [Buildroot] [PATCH v5 2/3] python-cheetah: add host-package
 support
In-Reply-To: <54FF7805.4070701@mind.be>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
 <1426011874-11011-2-git-send-email-gwenj@trabucayre.com>
 <54FF72A3.4040701@mind.be>
 <20150310234726.1b583693@free-electrons.com>
 <54FF7805.4070701@mind.be>
Message-ID: <20150311093404.55b72eda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 11 Mar 2015 00:02:29 +0100, Arnout Vandecappelle wrote:

>  For me, the acid test is what the package declares itself.
> Cheetah.egg-info/requires.txt says Markdown >= 2.0.1
> For perl packages, we trust whatever dependencies the package declares. If we
> would have a scancpan-like script for pypi, the dependency would be there.

I actually did start such a script at some point :-)

>  On the other hand, as long as the lack of dependency is not bothering anyone,
> we can leave it as it is :-) The purpose of discussion is what should be the
> guiding principle for future python packages. My proposal is: follow the egg info.

I'm fine with that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
