From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Mar 2013 17:39:30 +0100
Subject: [Buildroot] Release 1.0.0 of the Buildroot/Eclipse integration
In-Reply-To: <FBD7AD37A6A74823A8DFAD6AFE92493D@beraninstruments.com.local>
References: <1358088734-23460-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <FBD7AD37A6A74823A8DFAD6AFE92493D@beraninstruments.com.local>
Message-ID: <20130321173930.7f91d0ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Moore,

On Thu, 21 Mar 2013 16:33:30 -0000, Will Moore wrote:

> So far so good, I have eclipse integration working up to this point, this saves
> a lot of messing about that was previously required to configure a project to
> pick up the cross tools and libraries - thanks!

Thanks a lot for your feedback, really appreciated!

> The only thing I have noticed so far: there is a slight feature around the
> pkg-config automatic inclusion of libraries. If I select then unselect a library
> in the project properties "Pkg-config" tab in eclipse, then look at the "Tool
> Settings", "Libraries" I find that the library is still in the list.  Actually
> there are multiple inclusions of the same library in the libraries list. Then
> when I do a build, the linker command line has e.g. "... -luuid -lz -luuid -lz
> ..." on it.  It doesn't stop it working but it is untidy ... and when I have
> deselected the library I don't think I should find the linker still linking
> against it.

Yes, we also noticed this problem and we intend to work on fixing it.

It's worth noting that we will soon be releasing a new version of the
Eclipse integration, which includes support for Autotools projects and
Makefile-based projects.

Also, this work will be presented next week at EclipseCon US in Boston,
see
http://www.eclipsecon.org/2013/sessions/buildroot-eclipse-bundle-powerful-ide-embedded-linux-developers.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
