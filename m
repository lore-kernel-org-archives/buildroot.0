From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:05:03 +0100
Subject: [Buildroot] [PATCH 1/2] apr: security bump to version 1.6.3
In-Reply-To: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 30 Oct 2017 21:11:01 +0200")
References: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
Message-ID: <87po85jtq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-12613: Out-of-bounds array deref in apr_time_exp*()
 > functions.

 > Use upstream provided SHA256 hash.

 > Add license has.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
