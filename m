From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 16:12:12 +0100
Subject: [Buildroot] Buildroot defconfig issues
In-Reply-To: <878s7the18.fsf@dell.be.48ers.dk>
References: <6025e87c3e3ce_c6a70d4128370@gitlab-sidekiq-catchall-v1-bb68c6455-8rbvh.mail>
 <20210212091348.75f9cd17@windsurf.home>
 <878s7the18.fsf@dell.be.48ers.dk>
Message-ID: <20210213161212.66eff75b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Fri, 12 Feb 2021 09:43:31 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
> Hi,
>
>  > Hello,
>  > On Fri, 12 Feb 2021 02:31:24 +0000
>  > GitLab <gitlab@mg.gitlab.com> wrote:
>
>  >> Pipeline #254673538 (
>  >> https://gitlab.com/buildroot.org/buildroot/-/pipelines/254673538 )
>  >> triggered by Thomas Petazzoni ( https://gitlab.com/tpetazzoni )
>  >> had 4 failed builds.
>  >>
>  >> Job #1023448804 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1023448804/raw )
>  >>
>  >> Stage: test
>  >> Name: raspberrypi3_qt5we_defconfig
>
>  > So this is the infamous pkg-config/qt5webengine issue that Peter
>  > Seiderer tried to fix in
>  > https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report at gmx.net/
>  > but that I didn't like much.
>
>  > But perhaps what we have at:
>
>  >   https://patchwork.ozlabs.org/project/buildroot/patch/20191205171517.96639-3-michael.drake at codethink.co.uk/
>  >   https://patchwork.ozlabs.org/project/buildroot/patch/20191205171517.96639-4-michael.drake at codethink.co.uk/
>
>  > is a better solution for the problem ?
>
> Sorry, don't know.
>

Nope, using using pkgconf-personality does not fix the problem..., I believe
the qt5webengine GN build system is really just (false) requesting the host
versions of enabled qt5 target features, but did not find out where or
how to fix it...., other as by applying the one or the other hack ;-)

Regards,
Peter
