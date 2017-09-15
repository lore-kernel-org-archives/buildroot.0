From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Sep 2017 21:09:20 +0200
Subject: [Buildroot] [PATCH] lttng-tools: needs glibc
In-Reply-To: <3D6C8D45-596D-409C-94EB-9800F9C3DD9A@openadk.org>
References: <80f0f99699bcdacbed2aa551ef3051ab5dd45280.1505468019.git.baruch@tkos.co.il>
 <3D6C8D45-596D-409C-94EB-9800F9C3DD9A@openadk.org>
Message-ID: <20170915210920.2ee7fd28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Sep 2017 18:32:27 +0200, Waldemar Brodkorb wrote:

> why we can't disable the dlmopen call in the test? Didn't I suggested a patch or was it just a discussion on irc?

We discussed patching lttng-tools to disable building the tests, but
nobody ever sent a patch doing this I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
