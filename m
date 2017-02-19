From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Feb 2017 21:17:18 +0100
Subject: [Buildroot] [PATCH 00/58] python pypi library mass version bump.
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219211718.42744cc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 14:11:57 -0500, Adam Duskett wrote:

> I personally tested to make sure that all of these changes build properly on my
> machine before submitting.

The one problem I have with such a mass version bump is precisely that
a build test for Python modules is completely insufficient. Only a
runtime test can determine whether the bump is OK or not. As Yegor
said, a number of those modules gain new dependencies between one
version and another, and those can sometimes only be noticed by doing a
runtime test.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
