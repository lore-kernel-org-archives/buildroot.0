From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:56:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix static
 build with openssl and atomic
In-Reply-To: <20190413083452.6694-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Apr 2019 10:34:52 +0200")
References: <20190413083452.6694-1-fontaine.fabrice@gmail.com>
Message-ID: <87sgu79ny2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to find openssl dependencies such as lz or latomic
 > Fix build on sparc v8 (even if there is no autobuilder failures yet)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
