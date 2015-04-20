From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 23:25:18 +0200
Subject: [Buildroot] [git commit] pppd: fix url
In-Reply-To: <55356B4C.8030204@mind.be>
References: <20150420174941.EA21381D41@busybox.osuosl.org>
 <55356B4C.8030204@mind.be>
Message-ID: <20150420232518.7bf0f1b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 20 Apr 2015 23:10:36 +0200, Arnout Vandecappelle wrote:

>  Actually, we prefer to avoid https because of potential issues with
> certificates and limitations of corporate firewalls. And the http version works.

But redirects to https://, so using https:// directly is basically the
same.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
