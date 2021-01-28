From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:17:30 +0100
Subject: [Buildroot] [PATCH v2] package/uboot-tools: resolve host uboot
 env/script error
In-Reply-To: <20210126131437.9633-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Tue, 26 Jan 2021 07:14:37 -0600")
References: <20210126131437.9633-1-matthew.weber@rockwellcollins.com>
Message-ID: <87r1m4zuhx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
 > The host build of uboot-tools can occur early in the build process and may
 > require the creation of BINARIES_DIR before generation of an enabled envimage
 > and/or boot script binary. So to resolve this in proper way, separated the
 > build and installation part of uboot env/script in their respective commands.

 > Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v1 -> v2
 > [Thomas P
 >  - Split build and install operations out for script and env features.
 >    (Allows the install step to take care of the mkdir naturally)

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
