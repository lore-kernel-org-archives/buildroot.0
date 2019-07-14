From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:05:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.7.4
In-Reply-To: <20190710212137.112565-1-aduskett@gmail.com>
 (aduskett@gmail.com's message of "Wed, 10 Jul 2019 17:21:37 -0400")
References: <20190710212137.112565-1-aduskett@gmail.com>
Message-ID: <87wogl7wxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Also remove the following upstreamed patches:
 >   - 0033-bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
 >   - 0034-bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch

3.7.4 also includes a number of other security fixes, so I've marked it
as a security update and extended the commit message with that
information and applied, thanks.

-- 
Bye, Peter Korsgaard
