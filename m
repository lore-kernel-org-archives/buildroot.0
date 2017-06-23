From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 23 Jun 2017 23:33:51 +0200
Subject: [Buildroot] [PATCH 00/14] toolchain-external: remove support
 for glibc before 2.17
In-Reply-To: <20170622170131.7yvbkhrvute2movf@tarshish>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <02e9b62f-282c-ce57-a706-ccbbb33a5f0f@mind.be>
 <20170622170131.7yvbkhrvute2movf@tarshish>
Message-ID: <20170623213351.GU26922@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Baruch Siach wrote,

> package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
> 
>   Needed for uClibc posix_spawnp().

Then it shouldn't be needed, if it is only for uClibc-ng.
 
best regards
 Waldemar
