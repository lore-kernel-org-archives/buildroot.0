From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:29:17 +0200
Subject: [Buildroot] [PATCH v5 07/14] skeleton-common: rename
 SKELETON_ROOT_PASSWORD to SKELETON_CUSTOM_ROOT_PASSWORD
In-Reply-To: <20170801225224.16899-8-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
 <20170801225224.16899-8-arnout@mind.be>
Message-ID: <20170802192917.19f2e623@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 00:52:17 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Package variables should always be prefixed with the package name. For
> SKELETON_CUSTOM_ROOT_PASSWORD, this means we set the variable a second

The variable is now named SKELETON_COMMON_ROOT_PASSWORD, not
SKELETON_CUSTOM_ROOT_PASSWORD. I've fixed that in both the commit title
and in the above sentence.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
