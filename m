From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Apr 2014 15:03:34 +0200
Subject: [Buildroot] legal-info: which version to show in manifest for
	modified packages?
Message-ID: <CAAXf6LWqZeuCLB3kZK-pzYh1JqY8OMmG68wFcUN9rYqRiNu69g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm pondering on the following: which 'version' should we show in the
legal-info manifest for packages that have been modified for the
project and are using a version-controlled source?

For example, the linux and uboot packages allow to specify a custom
version and custom location of the sources. In a given project, the
version could be the git/hg/... revision of the repository containing
these modified sources of linux/uboot/...

When running 'make legal-info', these revision hashes would be stored
in the manifest.csv file, but these numbers are meaningless outside of
the project.

Aside from the technical complications to integrate this in buildroot,
would it instead be better to put the upstream version in the
manifest, being the base version used to make the modifications on?

Thanks for your input,
Thomas
