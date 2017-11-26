From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:05:14 +0100
Subject: [Buildroot] [PATCH 2/2] apr-util: security bump to version 1.6.1
In-Reply-To: <86642b9b91de8bec45167d6d947fa134f34334d5.1509390662.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 30 Oct 2017 21:11:02 +0200")
References: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
 <86642b9b91de8bec45167d6d947fa134f34334d5.1509390662.git.baruch@tkos.co.il>
Message-ID: <87lgitjtpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-12618: Out-of-bounds access in corrupted SDBM database.
 > Switch to bz2 compressed tarball.

 > Use upstream provided SHA256 hash.

 > Add license hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
