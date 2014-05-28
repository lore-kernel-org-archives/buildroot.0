From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 28 May 2014 10:45:07 +0200
Subject: [Buildroot] [PATCH v2] dropbear: fix missing directory with
	systemd
In-Reply-To: <87bnuicovg.fsf@dell.be.48ers.dk>
References: <1401263180-30574-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87bnuicovg.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivwXLj6kbWgNj=+FiMfqkB=j_v_toUZm=jwB549QO7nMaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Thanks, doing too much shell scripting currently :(

On Wed, May 28, 2014 at 10:02 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  > The current SysV startup script create a directory which is necessary
>  > for dropbear to correctly work.
>  > This creation is not done with systemd.
>
>  > Instead of both init creating the directory, we add the creation of this
>  > directory to the INSTALL_TARGET_CMDS to make sure it's present.
>
>  > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
> Committed with the TARGET_DIR reference fixed as pointed out by Thomas,
> thanks.
>
> --
> Bye, Peter Korsgaard
