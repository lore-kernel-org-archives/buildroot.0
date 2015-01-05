From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 17:38:53 +0100
Subject: [Buildroot] [PATCH v4 06/17] erlang-lager: new package.
In-Reply-To: <CAJtjsKZUp=pPN+QFDckg1eKwNdFjiy-LXTNJmxx92O530-1Aog@mail.gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-7-git-send-email-johan.oudinet@gmail.com>
 <20150104223713.16258168@free-electrons.com>
 <CAJtjsKZUp=pPN+QFDckg1eKwNdFjiy-LXTNJmxx92O530-1Aog@mail.gmail.com>
Message-ID: <20150105173853.208d1884@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 5 Jan 2015 17:10:32 +0100, Johan Oudinet wrote:
> Thomas, All,
> 
> On Sun, Jan 4, 2015 at 10:37 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Tue,  9 Dec 2014 15:34:11 +0100, Johan Oudinet wrote:
> >
> >> diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
> >> new file mode 100644
> >> index 0000000..b530c8e
> >> --- /dev/null
> >> +++ b/package/erlang-lager/erlang-lager.mk
> >> @@ -0,0 +1,14 @@
> >> +$(eval $(rebar-package))
> >> +$(eval $(host-rebar-package))
> >
> > Same as previous package: why a host variant is needed?
> 
> host-erlang-lager is listed in ejabberd dependencies. I do not
> remember why, so I'm going to check if it is really needed and add an
> explanation on the commit message if so.

Ah, my review did not go all the way to ejabberd, sorry about missing
this. Indeed, please check if host-erlang-lager is needed, and if it
is, quickly indicate in the commit log which package uses it.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
