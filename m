From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 23:32:42 +0100
Subject: [Buildroot] [PATCH v4] python: rework *.pyc files generation
In-Reply-To: <CAHXCMM+fZO0q-wTzwHMGK9cB5NWOJrh5Q_YNMU=G+dHM9OoHAQ@mail.gmail.com>
References: <1447948334-8440-1-git-send-email-yegorslists@googlemail.com>
 <CAHXCMM+fZO0q-wTzwHMGK9cB5NWOJrh5Q_YNMU=G+dHM9OoHAQ@mail.gmail.com>
Message-ID: <20151211233242.50a12f09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Fri, 11 Dec 2015 23:22:52 +0100, Samuel Martin wrote:

> AFAI have tested, this change works as expected, except for broken
> python modules.
> In such cases, 'compileall.compile_dir(...)' does not raise any
> exceptions when it failed to compile the *.py file, leading to the
> unfortunate consequence: the *.pyc file is not generated and the *.py
> file is lost if BR2_PACKAGE_PYTHON_PYC_ONLY is enabled.

Do you have some specific examples that exhibit this behavior?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
