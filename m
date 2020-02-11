From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix selection of
 bluez5_utils
In-Reply-To: <20200210230137.2335141-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 11 Feb 2020 00:01:37 +0100")
References: <20200210230137.2335141-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnekiwpz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Select BR2_PACKAGE_BLUEZ5_UTILS only if all its reverse dependencies
 > are selected

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
