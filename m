From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Mon, 07 Jan 2013 17:02:52 +0100
Subject: [Buildroot] [PATCH 1/5] gnuplot : new package
In-Reply-To: <20130107144800.29eb11ca@skate>
References: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
 <20130107144800.29eb11ca@skate>
Message-ID: <50EAF1AC.8090907@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07. 01. 13 14:48, Thomas Petazzoni wrote:
> Dear Anthony Viallard,
>
> On Mon,  7 Jan 2013 14:30:13 +0100, Anthony Viallard wrote:
>
>> +GNUPLOT_INSTALL_TARGET = YES
> This line is not needed.
>
> Also, please make your 1/5, 2/5, 3/5 and the LICENSE part of 5/5 a
> single patch.
>
> And then, a second patch containing your 4/5 and and the part of 5/5
> that disables the documentation and the demos.
>
> There has already been some discussion with Stefan about how to split
> patches, and it seems that it is still not clear. Each patch should be
> a logical change that works on its own.
>
> So for example, in the same series, putting a package in section "Foo",
> and then moving it to section "Bar" is very strange. Since you can
> rebase your patches, why don't you put the package in section "Bar" in
> the first place, so that we can believe you did everything perfectly
> from the very beginning? :-)
>
> You don't need to show to the whole world the gazillions of steps you
> followed to create a package. You need to show the whole world a nice,
> clean set of commits, where each commit is a logical change, that keeps
> the "buildability" of Buildroot.
>
> Does that make sense?
>
> Thomas
Indeed,

Sorry, i knew my post is not very sexy. This is because my git 
repository is very dirty and i don't known how clean my work.

I thoughwith lucky, my submit will be accepted :) Ok, i do the changes !

avd.
