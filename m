From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:58:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: drop wrong
 linux-headers dependency
In-Reply-To: <20200811223740.2473421-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine via buildroot's message of "Wed, 12 Aug 2020 00:37:40 +0200")
References: <20200811223740.2473421-1-fontaine.fabrice@gmail.com>
Message-ID: <87tuwmvk2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine via buildroot <buildroot@busybox.net> writes:

 > Commit 9ffcd9279e5505535a73cf1200b3a86fd425cf32 wrongly added a
 > linux-headers dependency when switching to meson.

 > Remove it as headers are always provided by the toolchain.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
