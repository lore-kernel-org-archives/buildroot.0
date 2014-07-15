From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 15 Jul 2014 10:07:25 +0200
Subject: [Buildroot] [PATCH] dependencies.sh message: fix Debian renamed
	packages
In-Reply-To: <53C4020E.10205@mind.be>
References: <1404988617-10992-1-git-send-email-kaszak@gmail.com>
 <53BF7888.2010803@mind.be>
 <CABbD_XDXsfHT0OJ1vkp0bpHmZ6cxO5pGwkOC-HJoySXfgpWfvA@mail.gmail.com>
 <53C4020E.10205@mind.be>
Message-ID: <CABbD_XD73PQT1FE+xfVviPBfibOO8KFOuGf6hON0kPfby0cCqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
>  [Please don't top-post, but reply in-line.]
>

[...]


>
>
>  OK, now I see. So I guess the multiarch version takes precedence when you
> have
> both.
>

I'm not sure about that, but I'm pretty sure that multiarch does not come
by default, you have to set it up first.


>
>  We should probably mention both options the, i.e.:
>
> echo "If you're running a Debian/Ubuntu distribution, install the
> libc6-386,"
> echo "lib32stcd++6, and lib32z1 packages (or alternatively libc6:i386,"
> echo "libstdc++6:i386, and zlib1g:i386)."
>
>
Agreed. Maybe mention that multiarch requires setting up, with "dpkg
--add-architecture <arch>".

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140715/6dd6d433/attachment.html>
