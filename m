From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jun 2017 14:08:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] linuxconsoletools: new package
In-Reply-To: <20170619214458.7fe41175@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 19 Jun 2017 21:44:58 +0200")
References: <201706191656.v5JGuLc9093352@mx1.sonologic.net>
 <20170619214458.7fe41175@windsurf.home>
Message-ID: <87a852g8v0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 19 Jun 2017 18:55:06 +0200, Koen Martens wrote:
 >> Linuxconsoletools contains the inputattach utility
 >> to attach legacy serial devices to the Linux kernel
 >> input layer and joystick utilities to calibrate and
 >> test joysticks and joypads.
 >> 
 >> The buildroot package adds options to build only certain
 >> tools.
 >> 
 >> website: http://sf.net/projects/linuxconsole/
 >> 
 >> Signed-off-by: Koen Martens <gmc@sonologic.nl>

 > Thanks, I've applied, after doing a few minor tweaks. See below.

Sorry for the slow response, I only noticed the patch now.

We already have (an old version of) this code in the input-tools
package, so the binaries here will conflict with those.

What is the way forward? Drop the old package and add Config.in.legacy
handling for the old symbols?

-- 
Bye, Peter Korsgaard
