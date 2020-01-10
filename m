From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 15:57:53 +0100
Subject: [Buildroot] [PATCH/2019.08.x 1/1] package/samba4: security
 version bump to 4.10.11
In-Reply-To: <20200104153715.3264323-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 4 Jan 2020 16:37:15 +0100")
References: <20200104153715.3264323-1-bernd.kuhls@t-online.de>
Message-ID: <87lfqfmk9a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
 >                 management server (dnsserver).
 > CVE-2019-14870: DelegationNotAllowed not being enforced in protocol
 >                 transition on Samba AD DC.

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.10.11.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Sorry, I got confused by the 2019.08.x (which is EOL), so I missed this
and made the same change myself.

For 2019.02.x I have instead bumped to 4.9.17, which fixes the same
issues.

-- 
Bye, Peter Korsgaard
