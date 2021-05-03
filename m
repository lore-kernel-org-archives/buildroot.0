From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 3 May 2021 15:34:53 -0700
Subject: [Buildroot] [PATCH] package/openjdk: drop patch left over after
 last bump
In-Reply-To: <87im436ivt.fsf@dell.be.48ers.dk>
References: <20210430203635.2605171-1-yann.morin.1998@free.fr>
 <87im436ivt.fsf@dell.be.48ers.dk>
Message-ID: <CAFSsvmpe+yu9Ncd9sheF9Ohw5FfZPGkQUOFWuC+YC1SWO9AArw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Peter;

Your wish is granted!

https://patchwork.ozlabs.org/project/buildroot/patch/20210501210613.1678989-1-aduskett at gmail.com/

Adam

On Fri, Apr 30, 2021 at 11:57 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Commit 5871e278f873 (package/openjdk{, -bin}: security bump to version
>  > 11.0.11_9) forgot to account for the openjdk patch in the versioned
>  > directory.
>
>  > That patch was a collection of backports from upstream ,that are now all
>  > present in 11.0.11+9, so drop that patch.
>
>  > Fixes: 5871e278f873
>  > Reported-by: Adam Duskett <aduskett@gmail.com>
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
>
> Ups - Committed, thanks.
>
> Adam: I see that java 14 is EOL. It would be great if you could bump
> OPENJDK_VERSION_LATEST to the 16.x series:
>
> https://adoptopenjdk.net/support.html
>
> --
> Bye, Peter Korsgaard
