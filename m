From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 21:25:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpm: drop unneeded third patch
In-Reply-To: <20190427204122.25709-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Apr 2019 22:41:22 +0200")
References: <20190427204122.25709-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1fageos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > After upstream review, I found that the third patch is not needed, just
 > doing an autoreconf fix the linking issue with -lintl

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
