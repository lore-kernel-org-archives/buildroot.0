From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 09:12:10 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
In-Reply-To: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
 (Daniel Mack's message of "Wed, 13 Jul 2011 01:05:10 +0200")
References: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
Message-ID: <87mxgifyd1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Is there a clever way to depend on variables set in the uClibc
 Daniel> configuration directly in package Config.in files? Something like
 Daniel> UCLIBC_HAS_EPOLL for example?

Unfortunately not. We have tweaked the default uClibc config so that all
packages should build (or patched packages where needed), so it normally
shouldn't be needed.

I consider using a custom uClibc configuration an advanced feature,
where the user is supposed to know what they are doing (tm).

-- 
Bye, Peter Korsgaard
