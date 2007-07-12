From: Julien Letessier <julien.letessier@technosens.fr>
Date: Thu, 12 Jul 2007 10:23:01 +0200
Subject: [Buildroot] Adding X11R7 to buildroot
Message-ID: <f0528b5b0707120123n67046381k243e42ef36c4ac83@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

As some of you known I've been working on X11R7.1 packages for
buildroot. These packages may replace xorg and tinyx.
Patches have ben sumbitted in previous emails.

I'm now starting to wonder
* if the buildroot community is interested in including these >250
packages in buildroot;
* how to include them (dropping hundreds of directories in package/ looks ugly);
* who's willing to help testing.

Note that since all X packages use the GNU build system and are
well-maintained and portable, they shouldn't require much maintenance
here.

What's your opinion?
-- 
Julien Letessier
<julien.letessier@technosens.fr>
