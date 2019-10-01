From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 08:32:12 +0200
Subject: [Buildroot] [PATCH v2] package/cups-filters: fix build without
 NLS
In-Reply-To: <CAJ4jsac+HBfCQOGEA=awN3mQBz4bPEq-Fbz8sX_-L9yYr8ua7A@mail.gmail.com>
 (Carlos Santos's message of "Mon, 30 Sep 2019 13:12:19 -0300")
References: <20190919034717.18806-1-unixmania@gmail.com>
 <87lfu552t5.fsf@dell.be.48ers.dk>
 <CAJ4jsadwCd+863EXMZGOnQTtag46zQ_v0FqDd6SQfmhiQKhd0w@mail.gmail.com>
 <87a7al3i6e.fsf@dell.be.48ers.dk>
 <CAJ4jsac+HBfCQOGEA=awN3mQBz4bPEq-Fbz8sX_-L9yYr8ua7A@mail.gmail.com>
Message-ID: <87lfu5yo0j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <unixmania@gmail.com> writes:

Hi,

 > On Mon, Sep 30, 2019 at 12:41 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> > I suggest you to pull commits 811f504ecd07df35ebf95c7b228ccc6461f7e736
 >> > and 3da92264c6dd693022d06fd2500878f7f5d492c2 too.
 >> 
 >> Yes, I will get to them (handling the backports in chronological
 >> order). Is there any specific reason to include the version bump? Is
 >> there a changelog/release notes available?

 > It includes the fixes contained in the previous two patches and make
 > autoreconf unnecessary, which speeds-up the build a little bit.

True, but it would also require bumping the version from the 1.21 series
(2019.02.x, 2019.05.x) and 1.23 series (2019.08.x).

But I will take the braille patch (if these older versions have that
configure option).

-- 
Bye, Peter Korsgaard
