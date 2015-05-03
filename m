From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 16:32:44 +0200
Subject: [Buildroot] [PATCH 1/2] poppler: add patch to fix invalid
	syntax in configure script
In-Reply-To: <1430660473-6997-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 May 2015 15:41:12 +0200")
References: <1430660473-6997-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <876189u3xv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When configuring poppler, a shell error occurs:
 > ./configure: line 19741: test: x: unary operator expected

 > This is due to an invalid configure test, which is fixed by a newly
 > added patch. We patch the configure script directly because poppler
 > doesn't autoreconf properly. A patch on configure.ac has been
 > submitted upstream so that hopefully we can drop our patch in a future
 > release of poppler.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
