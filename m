From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Apr 2017 00:52:01 +0200
Subject: [Buildroot] [PATCH 1/2] mosquitto: bump to version 1.4.11
In-Reply-To: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
 (Fabrice Fontaine's message of "Tue, 4 Apr 2017 21:37:29 +0200")
References: <1491334650-15708-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <87shljrfu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 >  - This version requires a patch (sent upstream) to remove -lanl from
 > all Linux builds as this library is only needed for adns support
 >  - sha512 must be computed locally as eclipse.org does not give it for
 > this version

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
