From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 22:37:39 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: try to fix unreproducible
 errors
In-Reply-To: <1481659403-7923-1-git-send-email-fabrice.fontaine@orange.com>
References: <1481659403-7923-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161213223739.7735f291@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 21:03:23 +0100, Fabrice Fontaine wrote:
> There is a lot of unreproducible issues with tinycbor, latest is:
> http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b

I'm confused: this one is the *only* error with tinycbor-v0.4. See the
full list of failures for this package at:
http://autobuild.buildroot.net/?reason=tinycbor-v0.4.

Why do you say there are a "lot of unreproducible issues" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
