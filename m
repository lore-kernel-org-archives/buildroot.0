From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 6 Feb 2012 22:10:16 +0100
Subject: [Buildroot] Help submitting patches
In-Reply-To: <87aa4vvffj.fsf@macbook.be.48ers.dk>
References: <CAC78Gpc2rZ8-9FjnkC=dNqAXBQ1pTSJ+yT0tdOtEzjEus7MmCQ@mail.gmail.com>
 <87aa4vvffj.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_ksNiUsa5N6ute0OQBY8KvHvDa72xWhSfKOngfzzORSpOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 6, 2012 at 10:07 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "J" == J C Woltz <jwoltz@gmail.com> writes:
>
> ?J> Please forgive my ignorance. I would like to submit some patches. I am using
> ?J> git. Can someone paste the commands to format patch and sign off?
>
> git format-patch -s master
>
> That is if you made your changes on a seperate branch like you should,
> otherwise replace master with the commit id of the last change before
> your local changes.

or just call

git format-patch -1

to format the last made patch. See here for further details for the
case you need to rework a patch series:
https://libbits.wordpress.com/2011/12/27/managing-patch-series-with-git/

Yegor
