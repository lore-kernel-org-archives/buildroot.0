From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 11:19:09 +0200
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Add patch for properly
 picking GL flags when building
In-Reply-To: <20170803113109.20158-1-aperez@igalia.com>
References: <20170803113109.20158-1-aperez@igalia.com>
Message-ID: <9455d5cd-58fa-fedd-92e6-03b21620d5e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-08-17 13:31, Adrian Perez de Castro wrote:
> This solves build failures caused by WebKit trying to include X11 headers
> when support for X11 is disabled in Mesa3D. A common situation is when
> configuring both GTK+ and WebKitGTK+ only with Wayland support.
> 
> Once the fix for https://bugs.webkit.org/show_bug.cgi?id=175125 makes it
> into a release, the patch can be dropped.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
