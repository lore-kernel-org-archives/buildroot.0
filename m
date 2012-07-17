From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:36:10 +0200
Subject: [Buildroot] [PATCH v4 00/22] Automatically produce legal
 compliance info
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20120717193610.638fabb2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 May 2012 19:32:59 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> here is the third version of the legal-info feature implementation.
> 
> Links to discussion of previous versions:
> v1: http://lists.busybox.net/pipermail/buildroot/2012-January/049590.html
> v2: http://lists.busybox.net/pipermail/buildroot/2012-March/051132.html
> v3: http://lists.busybox.net/pipermail/buildroot/2012-May/053574.html
> 
> This version is only a minor update to fix various issues reported by other
> developers. There are not changes to the general structure, so please see
> the link above for v3 for a detailed presentation.

Following the comments of several Buildroot contributors, I have merged
the 22 patches of your series. Thanks a lot for your perseverance in
getting this merged!

Now, I'd like to point something: the SPDX standard, documented at
http://spdx.org/. It is precisely designed to describe the list of
packages that compose a system. Since it's a big XML nightmare, I'm not
sure we want to support this, but at least they have a list of
licenses, each associated with a short name, that would be good to
follow as a convention, I think. See http://www.spdx.org/licenses/.
What do you think about this?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
