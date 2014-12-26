From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 26 Dec 2014 09:52:49 -0300
Subject: [Buildroot] [PATCH] binutils: add version 2.25
In-Reply-To: <20141226134342.2a270c35@free-electrons.com>
References: <1419423743-11400-1-git-send-email-gustavo@zacarias.com.ar>
 <20141226134342.2a270c35@free-electrons.com>
Message-ID: <549D5A21.4080706@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/26/2014 09:43 AM, Thomas Petazzoni wrote:
> Our default binutils version is still 2.22. I would propose to move to
> 2.24 as the default version. Thoughts?

2.24 has been in the tree for some time and covers all of the
architectures nicely (except bfin and avr32 that's going away) so it
sounds reasonable.
+1 from me.
Regards.
