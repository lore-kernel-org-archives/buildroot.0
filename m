From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 Mar 2021 23:59:21 +0100
Subject: [Buildroot] [PATCH] package/screen: add security fix for
 CVE-2021-26937
In-Reply-To: <20210226232256.25046-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 27 Feb 2021 00:22:55 +0100")
References: <20210226232256.25046-1-peter@korsgaard.com>
Message-ID: <87wnug53xy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > encoding.c in GNU Screen through 4.8.0 allows remote attackers to cause a
 > denial of service (invalid write access and application crash) or possibly
 > have unspecified other impact via a crafted UTF-8 character sequence.

 > For more details, see the oss-security discussion:
 > https://www.openwall.com/lists/oss-security/2021/02/09/3

 > So far no fix has been added to upstream git, and a number of early proposed
 > fixes caused regressions, so pull the security fix from the screen 4.8.0-5
 > Debian package.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
