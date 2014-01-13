From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 14 Jan 2014 09:54:26 +1300
Subject: [Buildroot] [PATCH v1] tcpreplay: bump version to 4.0.0
In-Reply-To: <87ioto179h.fsf@dell.be.48ers.dk>
References: <1389575003-17982-1-git-send-email-judge.packham@gmail.com>
 <87ioto179h.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZCm2AfWaQfOaHtU6M-urRb9oPFo0vU-qnymF+vSZVKxLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jan 13, 2014 at 11:54 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "judge" == judge packham <judge.packham@gmail.com> writes:
>
>  > From: Chris Packham <judge.packham@gmail.com>
>  > Update the tcpreplay package to version 4.0.0. The upstream package has
>  > a new maintainer and license. Version 4.0.0 brings a number of new
>  > features see http://tcpreplay.appneta.com/ for details.
>
>  > Signed-off-by: Chris Packham <judge.packham@gmail.com>
>  > ---
>  > Changes since v0:
>  > . Updated my git configuration to use a smtp server that doesn't modify my
>  >   messages in-flight.
>
> There's a number of build failures on the autobuilders. Care to take a
> look at fixing them?
>
> http://autobuild.buildroot.net/results/fec/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/build-end.log
> http://autobuild.buildroot.net/results/54b/54b739bd3713de87113cbed35e05b9074282b30d/build-end.log
>
> --
> Bye, Peter Korsgaard

I think the problem is things that don't define __VA_ARGS__ or things
that can't handle an empty argument list. And advice on how to fix
this?
