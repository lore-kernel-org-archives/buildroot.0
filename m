From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 12 Dec 2017 11:48:07 +0100
Subject: [Buildroot] Report of the Buildroot Developer meeting October
 21-22 2017, Prague
In-Reply-To: <3fbbe761-e93d-1a21-9f9e-3ef85da7d332@mind.be>
References: <3fbbe761-e93d-1a21-9f9e-3ef85da7d332@mind.be>
Message-ID: <CA+TH9V=C1J8mS_RMDOna06e7+s4G6AYi=x7UDHCtL_w_YEBGpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-10-25 21:45 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi all,
>
>  Last weekend, October 21-22 2017, we held a Buildroot Developer meeting in
> conjunction with ELC-E / OSS-E in Prague. You can find the report of the meeting
> at [1]. The full report is too long to repeat here, but these are the highlights.
>
>
>  First of all, a warm thank you to the MacGyver hackerspace and particularly our
> host Petr Barton for welcoming us. It was a really nice environment, it put us
> right in the mood for a hacking session, and Petr helped us a lot when we had
> problems with food delivery and by posting the status of Patchwork on a LED display.
>
>
>  The (according to me) most important and relevant points discussed were:
>
> * Support for "language" package managers. On the one hand, we will document in
> the FAQ why they don't work. On the other hand, we have to accept that they are
> coming (cfr. npm). Although for Python and Lua it works out quite well by just
> adding packages.

Cannot find anywhere anything about this, it should still be added to
the documentation?

> * Evaluation of LTS releases. There is general agreement that they are important
> and we'll continue doing it. How to contribute to the LTS branch should be
> clarified.
>
> * The gitlab mirror[2] gets mirrored again (pushed from the autobuild server,
> rather than triggered from gitlab itself) and the gitlab-CI tests[3] run.
>
> * The Buildroot association needs more attention. We should use the money for
> something useful rather than just funding the bank. Some ideas both for
> gathering money and for spending it were proposed.
>
> * Google Summer of Code: Buildroot will not participate in GSoC'18.
>
> * Top-level parallel build: we had a fruitful discussion about various aspects.
> The most important open point is what to do when multiple packages write/update
> the same file. The idea is to not allow that in top-level parallel build. But
> first, we'll try to evaluate how bad this problem is by reporting it in the
> autobuilders.
>
> * The patchwork queue has been reduced by about 80 patches (patches keep getting
> posted while we work on it so it's hard to count exactly).
>
>  Yes, this long list is the summary of the summary of what was discussed :-)
>
>
>  Here is the list of action points from the meeting:
> * Alexey will try Buildroot on WSL and MacOS.
> * Arnout will add the requirements for "language" package managers, and the
> conclusion that this is not possible, to the FAQ.
> * Alexey will document the way something can be marked for the LTS branches.
> * Arnout will write a web page that invites people to become a member of the
> Buildroot Association and that explains what will be done with the money.
> * Peter will ask OSUOSL if it is feasible that they host sources.buildroot.org
> and autobuild.buildroot.org.
> * Thomas will set up a Paypal account for the association, so non-EU members can
> pay easily.
>
>
> Finally, also a thank you to Essensium/Mind[4] for sponsoring the Sunday evening
> dinner.[*]
>
>
>  We forgot to decide on the next Buildroot Developer meeting, but normally it
> should be after FOSDEM, Mon-Tue February 5-6 2018.
>
>
>  Regards,
>  Arnout
>
>
> [1] https://elinux.org/Buildroot:DeveloperDaysELCE2017
> [2] https://gitlab.com/buildroot.org/buildroot
> [3] https://gitlab.com/buildroot.org/buildroot/pipelines
> [4] http://mind.be   <-- Check out the new website!
>
> [*] Yes, it feels weird to thank myself :-)
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
