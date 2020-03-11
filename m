From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2020 22:32:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/bootstrap: security bump to
 version 4.3.1
In-Reply-To: <20200213180051.1917130-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 13 Feb 2020 19:00:51 +0100")
References: <20200213180051.1917130-1-fontaine.fabrice@gmail.com>
Message-ID: <87mu8mh91c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2018-14042: In Bootstrap before 4.1.2, XSS is possible in the
 >   data-container property of tooltip.
 > - Fix an XSS vulnerability (CVE-2019-8331) in our tooltip and popover
 >   plugins by implementing a new HTML sanitizer
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
