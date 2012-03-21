From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 21 Mar 2012 12:42:34 +0100
Subject: [Buildroot] Random build results now available online
In-Reply-To: <20120321101327.49d34f93@skate>
References: <20120321101327.49d34f93@skate>
Message-ID: <4F69BEAA.9070608@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> During the Prague and Brussels last Buildroot meetings, we discussed
> the idea of putting online the results of the random configurations
> build that Peter and myself were doing.
>
> This week-end, I want ahead and implemented something. The results of
> both Peter builds and my builds are now visible online at:
>
>   http://buildroot.humanoidz.org/

Great! Thank you very much.

> Builds are running 24/7 on several machines (one build server of Free
> Electrons, and multiple machines of the gcc farm), and all results are
> visible online. For each result, one can see:
>
>   * the result (OK or NOK)
>   * the Git commit id identifying which Buildroot version was used. The
>     build machines are updating their version before every build
>   * which architecture was targeted
>   * which package is failing
>   * which machine was used for the build
>   * the 100 last lines of the build log (faster than having to download
>     the entire build log)
>   * the entire build log compressed
>   * the Buildroot configuration

Why not saving the defconfig as well?
It would be easier to browse and understand (although the full
config is probably better to reproduce the problem on a different
commit.

Luca
