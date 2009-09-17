From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 17 Sep 2009 11:13:34 -0300
Subject: [Buildroot] A more readable build output ?
In-Reply-To: <87fxamyrkw.fsf@macbook.be.48ers.dk>
References: <20090916231925.0a8ce23b@surf> <87fxamyrkw.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730909170713k325c42dbncbf59ba90f068807@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Sep 17, 2009 at 4:10 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>
> We basically have this already when you build with 'make -s'. It's not
> quite as quiet as we could wish, and non-makefile.autotools.in packages
> don't print their steps, but we could probably fix that.

Given that devs knows make better than users, I think it's acceptable
to require make V=1 to enable the verbose output.
Actually, openwrt has it this way, except that they use make V=99

> We can argue about what the default should be though, as the output is
> quite interesting for debugging purposes when things go wrong (your
> suggestion about logging to a file is nice).
>

I think the log is even better than what we have currently. Quite
often, the cause of the failed build is show several lines above the
end of the build, specially when doing parallel build (make -j2)

Kind Regards,
    Thiago A. Correa
