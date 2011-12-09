From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Dec 2011 09:44:49 +0100
Subject: [Buildroot] [PATCH 1/2] ipset: bump to version 6.10
In-Reply-To: <1322858749-16654-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 2 Dec 2011 17:45:48 -0300")
References: <1322858749-16654-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k466b0ce.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/ipset/ipset-drop-modules.patch |  100 --------------------------------

Why did you drop this patch? The build fails here as it ends up looking
at my host modules:

configure: error: Invalid kernel source directory /lib/modules/3.1.1/source
make: *** [/home/peko/source/buildroot/output/build/ipset-6.10/.stamp_configured] Error 1

-- 
Bye, Peter Korsgaard
