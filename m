From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 23 Dec 2019 16:30:11 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/pango: needs libfribidi
In-Reply-To: <20191212223900.08123555@gmx.net>
References: <20191209205224.2762-1-ps.report@gmx.net>
 <20191209205224.2762-2-ps.report@gmx.net>
 <20191212223448.7e1dc8ba@windsurf.home>
 <20191212223900.08123555@gmx.net>
Message-ID: <20191223163011.7a39705a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> >
> > A side question is: is here a way to tell Meson to never ever download
> > subprojects by itself, and instead bail out loudly ?
>
> Will investigate...
>

According to the meson documentation ([1]) the options

	--wrap-mode=nodownload
	--wrap-mode=nofallback
	--wrap-mode=forcefallback

are available, I think one of the first two would be
useful (the second as default, the fist-one for special
cases)?

Regards,
Peter

[1] https://mesonbuild.com/Subprojects.html#commandline-options
