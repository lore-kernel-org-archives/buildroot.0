From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 28 May 2013 11:02:53 -0500
Subject: [Buildroot] [PATCH 1/1] attr: bump to version 2.4.47
In-Reply-To: <20130528161303.126e7e64@skate>
References: <1369738614-31476-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20130528130703.694786e2@skate>
 <CAEBucnA0ZwDr35-9wr7jA3Gu-6pR_xpy6iXQo_EqGCnKdE4aZw@mail.gmail.com>
 <20130528161303.126e7e64@skate>
Message-ID: <CAEBucnB6VcA8ML8T6h_aK+anX83hA8-SycwrPkz_J+2B81g9DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Are you insinuating that my patch was not correct? :-) Come on, this
> never happens to me!

Of course not!  I'm just saying that maybe somewhere along the line
you may have overlooked the small aspect of installing the static
version of the library.  :-)

> If you look at 5ad2879a8bca386fa5c256a4286ccc928601cc1a, the purpose of
> the patch was not really to fix *other* libraries linking against the
> static version of attr, but rather fix the attr build process *itself*
> which was crashing when BR2_PREFER_STATIC_LIB=y.
>
> See
> http://autobuild.buildroot.org/results/58a3d4113172813183d43fddc1248b35bd0c4994/build-end.log

There is a libtool .la library in the folder where it is looking for a
.lai .  I don't understand libtool well enough to understand what the
difference is between a .la and .lai library.  Thus, I quit working on
it.

> That said, if other packages were still not able to link statically
> against attr after that patch, then clearly it means that the patch was
> not sufficient.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
