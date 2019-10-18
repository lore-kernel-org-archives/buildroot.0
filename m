From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:22:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pathpy: bump to version
 12.0.1
In-Reply-To: <20191018182628.15545-6-asafka7@gmail.com> (Asaf Kahlon's message
 of "Fri, 18 Oct 2019 21:26:03 +0300")
References: <20191018182628.15545-1-asafka7@gmail.com>
 <20191018182628.15545-6-asafka7@gmail.com>
Message-ID: <8736fphn9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > * Add license file (and hash).
 > * Support for Python 2 has dropped.

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 > ---
 >  package/python-pathpy/Config.in          | 1 +
 >  package/python-pathpy/python-pathpy.hash | 8 +++++---
 >  package/python-pathpy/python-pathpy.mk   | 5 +++--
 >  3 files changed, 9 insertions(+), 5 deletions(-)

 > diff --git a/package/python-pathpy/Config.in b/package/python-pathpy/Config.in
 > index 98c05126bf..7c7ffc9e92 100644
 > --- a/package/python-pathpy/Config.in
 > +++ b/package/python-pathpy/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_PYTHON_PATHPY
 >  	bool "python-pathpy"
 > +	depends on BR2_PACKAGE_PYTHON3

What then about the reverse dependencies? E.G. python-pytablereader?

-- 
Bye, Peter Korsgaard
