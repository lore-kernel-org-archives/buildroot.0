From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 9 Mar 2010 16:58:58 -0600
Subject: [Buildroot] Pull request for branch x11r75patches
In-Reply-To: <4B96D09D.4070100@carallon.com>
References: <4B96D09D.4070100@carallon.com>
Message-ID: <0D753D10438DA54287A00B027084269763682CDFC9@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, March 09, 2010 3:50 PM, Will Wagner wrote:
> I have setup a repository with my x11r7.5 changes merged into Paulius's 
> changes that have already been commited.
> 
> Most just bump things to newer version, but also have converted mesa3d 
> to autotools and added more option support when building xserver.

Hello,

Just an observation...

Is it really necessary for the x11r7 packages to have the version information
in the Config.in?  I don't think any of the other packages show this in the
help and it just adds more work when the versions get bumped.  If a user
"really" needs to know what the version is they can look at the associated
*.mk file.

Regards,
Hartley
