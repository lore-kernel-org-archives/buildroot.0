From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 12:27:29 +0200
Subject: [Buildroot] [PATCH 3/3] mediastreamer: add dependency on
	host-vim
In-Reply-To: <20170821205516.20620-3-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 21 Aug 2017 22:55:16 +0200")
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
 <20170821205516.20620-3-thomas.petazzoni@free-electrons.com>
Message-ID: <87mv68gm0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > host-vim is needed to provide the xxd tool, otherwise the build fails
 > with:

 > checking for xxd... no
 > configure: error: "xxd is required (provided by vim package)"

 > This isn't noticed by the autobuilders, presumably because all of them
 > have vim installed locally.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
