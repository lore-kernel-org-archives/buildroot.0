From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 21:34:05 +0100
Subject: [Buildroot] [PATCH v2 0/3] Gummiboot fixup
In-Reply-To: <20190320134754.14357-1-esben.haabendal@gmail.com> (Esben
 Haabendal's message of "Wed, 20 Mar 2019 14:47:51 +0100")
References: <20190320134754.14357-1-esben.haabendal@gmail.com>
Message-ID: <87ftrhcmki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esben.haabendal@gmail.com> writes:

 > From: Esben Haabendal <esben@haabendal.dk>
 > These patches fixes gummiboot for building with toolchains using
 > newer gcc and glibc versions.

 > Changes since v1:
 >  - Formatted patch with git format-patch and added SoB

 > Esben Haabendal (3):
 >   gummiboot: use new official upstream git repository
 >   gummiboot: upgrade to last commit before being removed
 >   gummiboot: fix compatibility with newer glibc versions

Committed series, thanks.

It would be great if you could send a patch to add an entry to the
DEVELOPERS file for gummiboot.

-- 
Bye, Peter Korsgaard
