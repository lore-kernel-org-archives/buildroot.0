From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 17:08:03 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <OF255A0DB6.0256D3EC-ON86257BEB.004C84DB-86257BEB.004F7C41@rockwellcollins.com>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
 <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
 <OF255A0DB6.0256D3EC-ON86257BEB.004C84DB-86257BEB.004F7C41@rockwellcollins.com>
Message-ID: <CAAXf6LWOeKch8sQ7H3qbKG3CEtL=R0mO1vZY38aggUNo6mtVcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Thu, Sep 19, 2013 at 4:28 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
>
>
> I was also going to to add to the documentation the versions of the Ubuntu
> packages that I got the manual to build with. Ubuntu version + package
> version so that way in the manual we can give a reference system
> configuration that we say builds the manual. For Ubuntu 10.04 I was having
> issues building the manual but with Ubuntu 12.04 I could successfully build
> everything.
>
> I haven't had a chance to get around to doing this yet so I don't know if
> you want to add your Ubuntu configuration as a reference configuration for
> generating the manual under Section 3.2? Maybe this warrants a subsection
> (3.2.1) in manual for generating the manual? If you don't get around to
> doing this, I will when I get around to adding some documentation to the
> regarding SELinux and information about patch reviews.

I'm wondering whether this is very useful. A user will not install
another Linux distribution just to build the buildroot manual, so the
Ubuntu version doesn't seem necessary to me. The package version only
seems relevant in case we know that some versions give problems for
building the manual. But unless we have some more info on that, I
would not add such info to the manual (also because it is very quickly
out-of-date).

For the problems you saw on Ubuntu 10.04, there may be a solution with
asciidoc 8.6.3, as I just posted in your original thread. If this
could be verified, then we could update the manual with just that.

Best regards,
Thomas
