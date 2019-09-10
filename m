From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Sep 2019 08:05:17 -0500
Subject: [Buildroot] [PATCH 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20190910095734.2075f70a@windsurf>
References: <20190910023753.51911-1-matthew.weber@rockwellcollins.com>
 <20190910023753.51911-2-matthew.weber@rockwellcollins.com>
 <20190910095734.2075f70a@windsurf>
Message-ID: <CANQCQpZyOtDpM9PhHqSkj8opGRWyVoLTmk5YPHN0yPvtwk1qdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Sep 10, 2019 at 2:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon,  9 Sep 2019 21:37:53 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > +# configure is missing but pkg seems to not be compatible with our autoreconf
> > +# mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
>
> Then you need host-automake and host-autoconf in the dependencies, and
> potentially host-libtool (if libtool is used).
>
> But how does it fail exactly ? Perhaps it can be fixed instead ?

None of the files are generated and checked in for use. (Maybe I'm
missing something?  I assume we have to autogen at that point if they
just provide the configure.ac)

Matt
