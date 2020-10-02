From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:27:45 +0200
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.3.6
In-Reply-To: <20200925181717.905681-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Fri, 25 Sep 2020 20:17:17 +0200")
References: <20200925181717.905681-1-francois.perrad@gadz.org>
Message-ID: <87imbt2fsu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2020.02.x, 2020.05.x and 2020.08.x given the bugfixes,
thanks.

I do see that we don't have a hash for doc/readme.html, and that the
content differs between 5.3.6 and 5.4.0, so that is no good :/

I guess we need to move to separate <version>/lua.hash files for each
version. Is this something you could do?

Thanks.

-- 
Bye, Peter Korsgaard
