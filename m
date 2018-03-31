From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 22:47:44 +0200
Subject: [Buildroot] [PATCH 2/3] package/strace: add missing libunwind
 optional dependency
In-Reply-To: <CAAXf6LWD8d24hEY2UJAJckCYfrTsTA5pDgN7YrFBwDngU7xcxw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 25 Feb 2018 22:58:39
 +0100")
References: <20180225183415.8362-1-romain.naour@gmail.com>
 <20180225183415.8362-2-romain.naour@gmail.com>
 <CAAXf6LXnevwOqgTb7yV5AraDkHsauEfhJNoQr8rNgWFLQKp15Q@mail.gmail.com>
 <20180225223438.42357172@windsurf.home>
 <CAAXf6LWD8d24hEY2UJAJckCYfrTsTA5pDgN7YrFBwDngU7xcxw@mail.gmail.com>
Message-ID: <877epst1jj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >>> In our local tree, I had added a config option to strace for that, but
 >>> perhaps that is overkill?
 >> 
 >> Are you saying that you have changes in your local tree on packages
 >> available in upstream Buildroot, and you did not submit such
 >> changes ? :-)
 >> 

 > Haha, yes indeed :-) But you may be glad to hear that I already made a
 > list of such changes that should be upstreamable, and plan to tackle
 > the upstreaming after merging 2018.02!

Did you already get 2018.02 merged? ;)

-- 
Bye, Peter Korsgaard
