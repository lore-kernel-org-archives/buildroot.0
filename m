From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 11:03:24 +0200
Subject: [Buildroot] [PATCH 3/3] whois: bump to version 5.2.17
In-Reply-To: <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 13 Aug 2017 21:34:19 +0300")
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
Message-ID: <87k21ci4gz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes serious usability issues (Debian changelog):
 >   * Fixed whois referrals for .com, .net, .jobs, .bz, .cc and .tv,
 >     broken by an ICANN-mandated output change:
 >     https://www.icann.org/resources/pages/rdds-labeling-policy-2017-02-01-en

 > Use snapshot.debian.org for the .dsc reference, since files tend to
 > disappear from the official Debian ftp site over time.

 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---

 > This should go to master IMO.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
