From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:47:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: drop threads
 dependency
In-Reply-To: <20210425135454.2460266-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 25 Apr 2021 15:54:54 +0200")
References: <20210425135454.2460266-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg3cg4dt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This dependency should have dropped by commit
 > 1a49188a69416542087acd1246b17c0139ff0054 which removed threads
 > dependency from libnfc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
