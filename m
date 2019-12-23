From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 10:01:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/cups: security bump to version
 2.3.1
In-Reply-To: <20191214105942.895486-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Dec 2019 11:59:42 +0100")
References: <20191214105942.895486-1-fontaine.fabrice@gmail.com>
Message-ID: <8736dbwh4c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2019-2228: The ippSetValuetag function did not validate the
 > default language value.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks.

For 2019.02.x I have instead bumped to 2.2.13, which contains the same
fix.

-- 
Bye, Peter Korsgaard
