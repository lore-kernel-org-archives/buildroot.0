From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:50:33 +0100
Subject: [Buildroot] [PATCH 13/25] package/Config.in: explain that lua
 package names should start with lua
In-Reply-To: <20170223170047.24417-14-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-14-arnout@mind.be>
Message-ID: <20170302225033.4c38fbab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:35 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We have decided that lua packages should have a name that starts with
> lua (like is the case for python and perl). However, we're not going to
> rename all the existing lua packages that don't start with lua. This
> makes it unclear for people adding packages how they should name the
> package, so add a comment to package/Config.in to explain it.

Should we require "lua" as a prefix or "lua-" ? For Perl and Python, we
use "perl-" and "python-" respectively.

We currently have 10 packages that start with "lua-", and 12 that start
with just "lua".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
