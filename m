From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 16:30:37 +0100
Subject: [Buildroot] [PATCH] package/netatalk: security bump to version
 3.1.23
In-Reply-To: <20181221125659.9409-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 21 Dec 2018 13:56:59 +0100")
References: <20181221125659.9409-1-peter@korsgaard.com>
Message-ID: <878t04s8de.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-1160: Netatalk before 3.1.12 is vulnerable to an out of
 > bounds write in dsi_opensess.c.  This is due to lack of bounds checking on
 > attacker controlled data.  A remote unauthenticated attacker can leverage
 > this vulnerability to achieve arbitrary code execution.

 > For more details, see the release notes:
 > http://netatalk.sourceforge.net/3.1/ReleaseNotes3.1.12.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
