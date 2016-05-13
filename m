From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 May 2016 09:40:30 +0200
Subject: [Buildroot] [PATCH] libinput: remove unneeded patch
In-Reply-To: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 13 May 2016 09:09:52 +0300")
References: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
Message-ID: <874ma2iexd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The log_msg symbol conflict was fixed in libevdev commit e4c315fc1603 (Rename
 > symbols leaking from static library to avoid name clashes, 2014-08-18) that
 > was included in version 1.3. Remove the patch that used to fix this issue.

Ehh, but we are still on 1.2.4. Shouldn't this go together with the
version bump to 1.3?

-- 
Bye, Peter Korsgaard
