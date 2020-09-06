From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 6 Sep 2020 09:58:53 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <87imcric55.fsf@dell.be.48ers.dk>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 <20200905211650.0a229191@windsurf.home>
 <CA+TH9Vn8cdHTKmoT1LLY7F=ywtuH_bSLFxZX1aQZgH6yFT26TA@mail.gmail.com>
 <20200905223835.1e68d658@windsurf.home>
 <CA+TH9VkgkuMUUy65L6njfjSuDeJ7wzXueJmX74XF9YQucd8RnA@mail.gmail.com>
 <20200905230431.34bcd9ea@windsurf.home>
 <CA+TH9Vn8aOXTCG-KeVNZ+=pJCEz5UXBhOtSqyf+uf8uts8hrsQ@mail.gmail.com>
 <CAFSsvmq4UWvSAhpmJCPt35PagXaZMuHVJenMd8d4oZd7E3KPDA@mail.gmail.com>
 <87imcric55.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_ktS7BTH0wJnVqu0naPjdw0+Yzd+gD-evhBH2dFT2T97xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Sep 6, 2020 at 9:43 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
>
> Hi,
>
> Thanks for the constructive input!
>
>  > Basic things that could be done with CI/CD that don't take much CPU power and
>  > would reduce the time spent on each patch:
>
>  >  - Running check-pkg automatically
>
> I guess you mean check-package?
>
>
>  >  - Running basic grammar and spelling checks
>
> I don't know how easy that is to do, given that commit messages often
> quote code and/or command output. We can certainly extend check-package
> to run the commit message through aspell. What open source utilities are
> available for grammar checks?

I am using codespell: https://github.com/codespell-project/codespell

>
>  >  - Checking if all recursive dependencies of new packages have been added in
>  >    new Config.in files.
>
> That IMHO very fast becomes complicated with optional dependencies and
> patches to existing packages rather than a completely new package, but
> if you have a good idea?
>
>
>  > If you want to get complicated a reduction of CPU time/resources could
>  > also be done with:
>  >   - Having prebuilt docker images or tarballs that have a partially
>  > complete build
>
> I am not sure how realistic that is given that master (or next) is a
> moving target and we would want to test against the current situation?

Regards,
Yegor
