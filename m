From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:39:10 +0200
Subject: [Buildroot] [PATCH] qwt: fix build when BR2_STATIC_LIBS=y
In-Reply-To: <20170511134657.8755-1-gwenj@trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Thu, 11 May 2017 15:46:57 +0200")
References: <20170511134657.8755-1-gwenj@trabucayre.com>
Message-ID: <87mvaejqn5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > By default, qwt build a shared library, but when BR2_STATIC_LIBS is set
 > compilation failed with errors like :
 > __uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
 > __uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
 > __uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'

 > This patch disable QwtDll to build a static library when BR2_STATIC_LIBS=y.

 > fix:
 > http://autobuild.buildroot.net/results/739/739406bb8073d1861933872a47802954d9767634/

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
