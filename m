From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 19:58:06 +0100
Subject: [Buildroot] [PATCH] json-c: bump to version 0.13
In-Reply-To: <78b00dd8559b57a0c687caf9aef6c28c243b7f89.1514057383.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 23 Dec 2017 21:29:43 +0200")
References: <78b00dd8559b57a0c687caf9aef6c28c243b7f89.1514057383.git.baruch@tkos.co.il>
Message-ID: <87h8sduxj5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use upstream provided tarball; drop autoreconf.
 > Drop -Werror removal patch; json-c builds fine with gcc 7 without this
 > patch.

 > Drop upstream libm patch.

 > Drop --disable-oldname-compat; removed upstream.

 > Add license file hash.

 > Enable parallel build. The commit introducing MAKE1, ecd0f65af92
 > (json-c: bump to version 0.11) does not explain the reason for that. A
 > sequence of a few builds on a multi-core system never faild.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>


Committed, thanks.

-- 
Bye, Peter Korsgaard
