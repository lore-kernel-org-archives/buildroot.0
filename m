From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 08:41:01 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/gstreamer1/gstreamer1-editing-services: disable introspection
In-Reply-To: <20200820183210.775080-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 20 Aug 2020 20:32:10 +0200")
References: <20200820183210.775080-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2lyj6o2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable introspection as it raises a build failure with autotools.
 > It could be enabled after bumping to upcoming 1.18.x and switching to
 > messon. We can't switch now as version 1.16.2 don't allow to disable
 > examples/tools through meson

 > Fixes:
 >  - http://autobuild.buildroot.org/results/36eb875fba2847b32df05f31d8f8ca9f0ecde36f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
