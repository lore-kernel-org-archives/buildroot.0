From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 15:54:50 +0200
Subject: [Buildroot] [PATCH 2/2] cc-tool: add patch fixing boost.m4
 logic for static linking
In-Reply-To: <20170820133416.11231-2-thomas.petazzoni@free-electrons.com>
References: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
 <20170820133416.11231-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20170820155450.7ec3cde0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 15:34:16 +0200, Thomas Petazzoni wrote:

>  ...-fix-rpath-option-check-for-static-linkin.patch | 44 ++++++++++++++++++++++

This patch was submitted upstream, but not in cc-tool since in fact
boost.m4 comes from a dedicated project, and gets duplicated in
cc-tool. So I've submitted to the official boost.m4 project,
https://github.com/tsuna/boost.m4/pull/103.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
