From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 17 Jan 2012 23:13:08 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <87ty3upg82.fsf@macbook.be.48ers.dk>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <201201161845.51186.arnout@mind.be> <8739bfcusn.fsf@macbook.be.48ers.dk>
 <201201171457.13088.arnout@mind.be> <87ty3upg82.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_ks1+PmxFWF6CAA7Y4FSaWVKSaOvRZXwQRVXti=ojMcRbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 17, 2012 at 3:15 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> ?Arnout> That option should set
> ?Arnout> KMOD_INSTALL_STAGING = NO
> ?>>
> ?>> Why would you not install into staging?
>
> ?Arnout> ?That should me KMOD_INSTALL_TARGET, of course.
>
> You would still need to install the shared library, so we should rather
> remove the binary instead.

I added this package, because it is udev's dependency now. I'll have
to look into udev, to tell if it uses only library or binary too.

As we came to this topic, what is your opinion on adding /run? It also
became udev's dependency.

I'll set my udev's patch series tomorrow.

Yegor
