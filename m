From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Tue, 15 Jul 2008 21:52:10 -0600
Subject: [Buildroot] buildroot size ballooned
In-Reply-To: <487D6CCC.7060109@acsatlanta.com>
References: <487D6CCC.7060109@acsatlanta.com>
Message-ID: <487D706A.30908@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph G. Boike wrote:
> Hi, my buildroot filesize had been around 3-4M (w/ r 22508)
> With r 225765 and building using at91sam9260dfc_defconfig the filesize 
> has jumped to ~14M.
> Any thoughts on why?
> (I have kernel 2.6.26 now.  The kernel size has been fairly consistent 
> around 1.5M.)


No idea, but a clarification, are you talking about buildroot's 
outputted final rootfs, or buildroot project in svn?

-- 
Nathanael d. Noblet
Gnat Solutions, Inc
T: 403.875.4613
