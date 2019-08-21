From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 14:42:36 +0200
Subject: [Buildroot] [PATCH 1/2] package/cloop: needs _GNU_SOURCE
In-Reply-To: <20190801122109.25535-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 1 Aug 2019 14:21:08 +0200")
References: <20190801122109.25535-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7c2666b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-cloop needs _GNU_SOURCE for loff_t otherwise build fails with gcc
 > 8.3.0 on:
 > extract_compressed_fs.c: In function 'main':
 > extract_compressed_fs.c:55:2: error: unknown type name 'loff_t'; did you mean 'off_t'?
 >   loff_t *offsets;

 > Fixes:
 >  - No autobuilder failures

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
