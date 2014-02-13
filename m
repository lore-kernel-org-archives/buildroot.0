From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 23:18:24 +0100
Subject: [Buildroot] [PATCH 1/3] python-setuptools: bumped version to 0.8
In-Reply-To: <20140213221244.117882f0@skate>
References: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
 <20140213221244.117882f0@skate>
Message-ID: <20140213231824.7e1e44d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rohan, all,

On Thu, 13 Feb 2014 22:12:44 +0100, Thomas Petazzoni wrote:

> For Perl, Fran?ois Perrad has written a script that given a Perl CPAN
> package creates all the necessary Buildroot packages. Such an approach
> was accepted by the Buildroot developers, and maybe we should look at
> having something similar for Python modules.

I just tried this idea, see the attached (ugly) script.

Unfortunately, there are quite a few limitations:

  - The script is currently not able to guess the <pkg>_SETUP_TYPE,
    i.e whether the package should be built with distutils or
    setuptools.

  - The Pypi informations seem to very limited. A number of packages
    don't even give the URL of their tarball, the licensing
    informations are incomplete, there is no reference to the file
    containing the license text, etc.

If anyone wants to pursue this experimentation, feel free to pick up
the script and improve it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pypi-gen-packages
Type: application/octet-stream
Size: 3380 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140213/f94dc71b/attachment.obj>
