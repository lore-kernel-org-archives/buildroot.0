From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 10:20:02 +0200
Subject: [Buildroot] Autobuilder reporting old build issues
In-Reply-To: <20170715100105.108fb7ab@windsurf>
References: <20170715100105.108fb7ab@windsurf>
Message-ID: <20170716102002.6d570790@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Sat, 15 Jul 2017 10:01:05 +0200, Thomas Petazzoni wrote:

> Is there something special going on with your autobuilder setup?
> Indeed, it very often reports build results that are based on Buildroot
> versions that are a few days old, as if you're not testing the latest
> Buildroot.
> 
> For example, if you look at the attached screenshot, all autobuilder
> instances reported results based on Buildroot 05827480 (the strace
> commit I made yesterday evening), except your autobuilder results,
> which were based on 704db158 (a commit made on July 10, i.e 4-5 days
> ago).

Since your autobuilder is still reporting build results that date back
from commit 704db158, I've disabled your account so that build results
from your autobuilder are no longer accepted.

Let me know when the problem is fixed, so that I can re-enable your
account.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
