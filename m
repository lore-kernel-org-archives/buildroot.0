From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Mar 2019 13:34:28 +0100
Subject: [Buildroot] modules
In-Reply-To: <925021551779772@sas2-ce04c18c415c.qloud-c.yandex.net>
 (=?utf-8?B?ItCR0YvRgdGC0YDQvtCyCdCS0LjRgtCw0LvQuNC5Iidz?= message of "Tue,
 05 Mar 2019 12:56:12 +0300")
References: <24581291551766817@myt5-262fb1897c00.qloud-c.yandex.net>
 <87k1hdhdqf.fsf@dell.be.48ers.dk>
 <925021551779772@sas2-ce04c18c415c.qloud-c.yandex.net>
Message-ID: <87fts1h54b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "???????" == ??????? ??????? <error25@yandex.ru> writes:

 > Hi
 > I when compile , link  http://sources.buildroot.net/stblinux-3.3-3.0a.tar.bz2
 > and no file ((

sources.buildroot.net is the default source code mirror for buildroot,
but we do not have any packages using that stblinux file, so we
(naturally) don't have the file.
)
 > https://github.com/philkingston/pios
 > note
 > Please feed suggestions, bug reports, insults, and bribes back to the
 > buildroot mailing list: buildroot at buildroot.org

That is correct for Buildroot itself, but this Phil Kingston has made
modifications to Buildroot including that stblinux file, so he is most
likely to be able to help you.

-- 
Bye, Peter Korsgaard
