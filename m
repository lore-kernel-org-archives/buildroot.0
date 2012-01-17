From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 18 Jan 2012 00:15:17 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <871uqyorrx.fsf@macbook.be.48ers.dk>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <87ty3upg82.fsf@macbook.be.48ers.dk>
 <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
 <201201180000.22317.arnout@mind.be> <871uqyorrx.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_kuOW9q4VvLHdUMikwT3otd=+oBSuA0oOPefgG3HuYC4Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 18, 2012 at 12:04 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> ?Arnout> On Tuesday 17 January 2012 23:13:08 Yegor Yefremov wrote:
> ?>> As we came to this topic, what is your opinion on adding /run? It also
> ?>> became udev's dependency.
>
> ?Arnout> ?IIRC /run basically replaces /var/run in Fedora, Debian, SuSE
> ?Arnout> and others. ?Since we anyway symlink /var/run to /tmp, we can
> ?Arnout> easily do the same for /run.
>
> That's my understanding as well. I don't have any issues with adding a
> /run symlink to fs/skeleton.

O.K. I'll prepare the patch.

Yegor
