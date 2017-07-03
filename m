From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 00:08:01 +0200
Subject: [Buildroot] ninja/python-meson packages
In-Reply-To: <6cbd72f3-e32d-6b85-0c64-47b9c2664f59@imgtec.com> (Vicente
 Olivert Riera's message of "Mon, 3 Jul 2017 16:17:45 +0100")
References: <98b7a6164112ee321e9220d5b8c47a33@openmailbox.org>
 <d309c350-d2df-4eb0-8114-bea29d3a05dd@gmail.com>
 <6cbd72f3-e32d-6b85-0c64-47b9c2664f59@imgtec.com>
Message-ID: <87h8yt5g3i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > libinput is another package that will migrate to meson, and it will stop
 > supporting autotools. From
 > https://lists.freedesktop.org/archives/wayland-devel/2017-June/034286.html :

 > "The first RC for libinput 1.8 is now available.

 > The biggest change in this release is that libinput has switched to
 > meson as primary build system, the 1.8.x releases are the last ones to
 > support (and be released with) autotools so you're encouraged to start
 > switching your build processes over to meson."

Yes, I noticed that as well. We'll have to work on meson support
infrastructure relatively soon.

-- 
Bye, Peter Korsgaard
