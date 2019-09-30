From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 17:41:45 +0200
Subject: [Buildroot] [PATCH v2] package/cups-filters: fix build without
 NLS
In-Reply-To: <CAJ4jsadwCd+863EXMZGOnQTtag46zQ_v0FqDd6SQfmhiQKhd0w@mail.gmail.com>
 (Carlos Santos's message of "Mon, 30 Sep 2019 11:01:48 -0300")
References: <20190919034717.18806-1-unixmania@gmail.com>
 <87lfu552t5.fsf@dell.be.48ers.dk>
 <CAJ4jsadwCd+863EXMZGOnQTtag46zQ_v0FqDd6SQfmhiQKhd0w@mail.gmail.com>
Message-ID: <87a7al3i6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <unixmania@gmail.com> writes:

 > On Mon, Sep 30, 2019 at 10:30 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:
 >> 
 >> > From: Carlos Santos <unixmania@gmail.com>
 >> > texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE so pull a
 >> > patch applied upstream that adds libiconv discovery via autoconf.
 >> 
 >> > With this change, autoreconf requires the config.rpath and ABOUT-NLS
 >> > files which are not in v1.25.4. Add a pre-configure hook to fake them.
 >> 
 >> > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12031
 >> 
 >> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 >> 
 >> Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.
 >> 
 >> --
 >> Bye, Peter Korsgaard

 > I suggest you to pull commits 811f504ecd07df35ebf95c7b228ccc6461f7e736
 > and 3da92264c6dd693022d06fd2500878f7f5d492c2 too.

Yes, I will get to them (handling the backports in chronological
order). Is there any specific reason to include the version bump? Is
there a changelog/release notes available?

-- 
Bye, Peter Korsgaard
