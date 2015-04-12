From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 10:41:13 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-04-11
In-Reply-To: <CAMo8BfK4+9oE11xoPuQxqHXjh=oJ6cb9LkWAab+g2o82uyzZ0w@mail.gmail.com>
References: <20150412063020.68757101071@stock.ovh.net>
 <CAMo8BfK4+9oE11xoPuQxqHXjh=oJ6cb9LkWAab+g2o82uyzZ0w@mail.gmail.com>
Message-ID: <20150412104113.4f1e8d2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Sun, 12 Apr 2015 10:47:33 +0300, Max Filippov wrote:
> On Sun, Apr 12, 2015 at 9:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Build statistics for 2015-04-11
> >       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/cb3aa9bf4c7e38649f1a62be67c58e34cc786595/
> >       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/1fc251eaefd56b1fc18e885debd5d97cc1261b42/
> >       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/575fcea8b082a91c08d75db13d478b271c68083c/
> 
> Fixed by https://patchwork.ozlabs.org/patch/453567/

Yes, I know. I am just wondering if this is the right fix. It really
seems odd to be doing comparisons on the output of gcc. Autoconf should
be able to do much better than that.

What is this piece of code trying to do? Why doesn't it simply reply on
the return value of gcc when testing if this or that feature is
available?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
