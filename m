From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 25 Mar 2017 16:34:43 +0100
Subject: [Buildroot] Problem when $(PKG)_SOURCE does not contain
 $(PKG)_VERSION
In-Reply-To: <20170325154712.793f92be@free-electrons.com>
References: <20170325143456.GA2470@itchy>
 <20170325154712.793f92be@free-electrons.com>
Message-ID: <20170325153443.GA7050@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-03-25 15:47:12, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 25 Mar 2017 15:34:56 +0100, Eric Le Bihan wrote:
>
> > Is there a way to fix this problem, by renaming the tarball in a
> > post-download hook or using a hash verification trick?
>
> Simply add a hash file, Buildroot will realize the hash is different
> and re-download the tarball.

What puzzles me was that I already had set a hash file. I'll do more
tests.

Thanks for the hint.

--
ELB
