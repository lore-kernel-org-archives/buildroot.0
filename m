From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 22:05:21 +0200
Subject: [Buildroot] [PATCH v2 5/5] python-flask-bootstrap: new package
In-Reply-To: <20180206132506.30389-5-aduskett@gmail.com>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180206132506.30389-5-aduskett@gmail.com>
Message-ID: <20180916220521.7f8af6a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 08:25:06 -0500, Adam Duskett wrote:
> Flask-Bootstrap packages Bootstrap into an extension that mostly consists of a
> blueprint named 'bootstrap'. It can also create links to serve Bootstrap from
> a CDN and works with no boilerplate code in your application.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

The license issue has not been resolved
(https://github.com/mbr/flask-bootstrap/issues/181) and the
check-package issues have also not been fixed in a new iteration.

Consequently, I've marked this patch as Changes Requested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
