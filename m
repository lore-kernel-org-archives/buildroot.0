From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 28 Oct 2014 08:21:47 +0100
Subject: [Buildroot] [PATCH v6 0/2] Mono new package
In-Reply-To: <544EC442.5030804@lucaceresoli.net>
References: <1414009330-4433-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141025105055.05c53953@free-electrons.com>
 <544EC442.5030804@lucaceresoli.net>
Message-ID: <CA+TH9VngG20VsJqPQUkRT14u+w8_DB+U8f7pZWf3e9+nF7SR9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca,

> BTW, Angelo, Thomas, where did you get licensing info when
> writing/committing the package?

Mono is a complex piece of software composed by several components, so
the licensing scheme is complex. I'll try to summarize here.

The file COPYING.LIB is quite explicative:

"The Mono runtime is licensed under the terms of the GNU
Library General Public License, version 2.

The eglib directory is licensed under the terms of the MIT
X11 license and is a drop-in replacement for Mono's use of
glib 2.0 (which was LGPL).

The Boehm licensing information is in the libgc directory

The SGen Garbage Collector is under the terms of the MIT X11
license

The class libraries under mono/mcs are unless otherwise stated
under the MIT X11 license.

Open source Microsoft code is licensed under the original terms
which is either MS-PL for older components, or dual licensed
MS-PL/Apache2 licensed."

* The C# compiler is dual-licensed under the MIT/X11 license and the
GNU General Public License (GPL).

Every file inside mcs/mcs folder has this preamble "Dual licensed
under the terms of the MIT X11 or GNU GPL"

* The tools are released under the terms of the GNU General Public
License (GPL).

Not every file has a license in it's preamble, but the most part show
a GPL preamble.

* The class libraries are released under the terms of the MIT X11 license.

Every file inside mcs/class show a MIT.X11 preamble

It's complex but it shows some sense!
For the practical point of view of using it, you should comply with
the license of the software you ship so the mono runtime and mono
class only (LGPL2, MIT)

Hope this clarify!

Sincerely, Angelo.


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
