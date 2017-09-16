From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 16 Sep 2017 02:16:44 +0200
Subject: [Buildroot] [PATCH] lttng-tools: needs glibc
In-Reply-To: <20170915210920.2ee7fd28@windsurf>
References: <80f0f99699bcdacbed2aa551ef3051ab5dd45280.1505468019.git.baruch@tkos.co.il>
 <3D6C8D45-596D-409C-94EB-9800F9C3DD9A@openadk.org>
 <20170915210920.2ee7fd28@windsurf>
Message-ID: <20170916001644.GA7617@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 15 Sep 2017 18:32:27 +0200, Waldemar Brodkorb wrote:
> 
> > why we can't disable the dlmopen call in the test? Didn't I suggested a patch or was it just a discussion on irc?
> 
> We discussed patching lttng-tools to disable building the tests, but
> nobody ever sent a patch doing this I believe.

Ah right. You pasted a configure.ac snippet, but I was too lazy to
take it and propose a nice patch to br ml and upstream.

You still have the snippet? May be Baruch isn't so lazy?

best regards
 Waldemar
